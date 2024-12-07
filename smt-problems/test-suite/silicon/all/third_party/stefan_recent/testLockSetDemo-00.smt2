(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:10
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testLockSetDemo.vpr
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
(declare-sort Multiset<$Ref> 0)
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
(declare-fun $SortWrappers.Multiset<$Ref>To$Snap (Multiset<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToMultiset<$Ref> ($Snap) Multiset<$Ref>)
(assert (forall ((x Multiset<$Ref>)) (!
    (= x ($SortWrappers.$SnapToMultiset<$Ref>($SortWrappers.Multiset<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Multiset<$Ref>To$Snap x))
    :qid |$Snap.$SnapToMultiset<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Multiset<$Ref>To$Snap($SortWrappers.$SnapToMultiset<$Ref> x)))
    :pattern (($SortWrappers.$SnapToMultiset<$Ref> x))
    :qid |$Snap.Multiset<$Ref>To$SnapToMultiset<$Ref>|
    )))
; ////////// Symbols
(declare-fun Multiset_count (Multiset<$Ref> $Ref) Int)
(declare-fun Multiset_card (Multiset<$Ref>) Int)
(declare-const Multiset_empty Multiset<$Ref>)
(declare-fun Multiset_singleton ($Ref) Multiset<$Ref>)
(declare-fun Multiset_unionone (Multiset<$Ref> $Ref) Multiset<$Ref>)
(declare-fun Multiset_union (Multiset<$Ref> Multiset<$Ref>) Multiset<$Ref>)
(declare-fun Multiset_intersection (Multiset<$Ref> Multiset<$Ref>) Multiset<$Ref>)
(declare-fun Multiset_difference (Multiset<$Ref> Multiset<$Ref>) Multiset<$Ref>)
(declare-fun Multiset_subset (Multiset<$Ref> Multiset<$Ref>) Bool)
(declare-fun Multiset_equal (Multiset<$Ref> Multiset<$Ref>) Bool)
(declare-fun Multiset_skolem_diff (Multiset<$Ref> Multiset<$Ref>) $Ref)
(declare-fun Multiset_disjoint (Multiset<$Ref> Multiset<$Ref>) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun LockSet__lockset%trigger ($Snap $Ref Multiset<$Ref>) Bool)
(declare-fun Client__inv%trigger ($Snap $Ref $Perm) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((ms Multiset<$Ref>) (x $Ref)) (!
  (>= (Multiset_count ms x) 0)
  :pattern ((Multiset_count ms x))
  )))
(assert (forall ((s Multiset<$Ref>)) (!
  (<= 0 (Multiset_card s))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((o $Ref)) (!
  (= (Multiset_count (as Multiset_empty  Multiset<$Ref>) o) 0)
  :pattern ((Multiset_count (as Multiset_empty  Multiset<$Ref>) o))
  )))
(assert (forall ((s Multiset<$Ref>)) (!
  (and
    (= (= (Multiset_card s) 0) (= s (as Multiset_empty  Multiset<$Ref>)))
    (=>
      (not (= (Multiset_card s) 0))
      (exists ((x $Ref)) 
        (< 0 (Multiset_count s x)))))
  :pattern ((Multiset_card s))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (and
    (= (= (Multiset_count (Multiset_singleton r) o) 1) (= r o))
    (= (= (Multiset_count (Multiset_singleton r) o) 0) (not (= r o))))
  :pattern ((Multiset_count (Multiset_singleton r) o))
  )))
(assert (forall ((r $Ref)) (!
  (and
    (= (Multiset_card (Multiset_singleton r)) 1)
    (= (Multiset_count (Multiset_singleton r) r) 1))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((r $Ref)) (!
  (=
    (Multiset_singleton r)
    (Multiset_unionone (as Multiset_empty  Multiset<$Ref>) r))
  :pattern ((Multiset_singleton r))
  )))
(assert (forall ((a Multiset<$Ref>) (x $Ref) (o $Ref)) (!
  (=
    (Multiset_count (Multiset_unionone a x) o)
    (ite (= x o) (+ (Multiset_count a o) 1) (Multiset_count a o)))
  :pattern ((Multiset_count (Multiset_unionone a x) o))
  :pattern ((Multiset_unionone a x) (Multiset_count a o))
  )))
(assert (forall ((a Multiset<$Ref>) (x $Ref)) (!
  (= (Multiset_card (Multiset_unionone a x)) (+ (Multiset_card a) 1))
  :pattern ((Multiset_card (Multiset_unionone a x)))
  :pattern ((Multiset_unionone a x) (Multiset_card a))
  )))
(assert (forall ((a Multiset<$Ref>) (x $Ref)) (!
  (and
    (> (Multiset_count (Multiset_unionone a x) x) 0)
    (> (Multiset_card (Multiset_unionone a x)) 0))
  :pattern ((Multiset_unionone a x))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>) (o $Ref)) (!
  (=
    (Multiset_count (Multiset_union a b) o)
    (+ (Multiset_count a o) (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_union a b) o))
  :pattern ((Multiset_union a b) (Multiset_count a o) (Multiset_count b o))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=
    (Multiset_card (Multiset_union a b))
    (+ (Multiset_card a) (Multiset_card b)))
  :pattern ((Multiset_card (Multiset_union a b)))
  :pattern ((Multiset_card a) (Multiset_union a b))
  :pattern ((Multiset_card b) (Multiset_union a b))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>) (o $Ref)) (!
  (=
    (Multiset_count (Multiset_intersection a b) o)
    (ite
      (<= (Multiset_count a o) (Multiset_count b o))
      (Multiset_count a o)
      (Multiset_count b o)))
  :pattern ((Multiset_count (Multiset_intersection a b) o))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=
    (Multiset_intersection (Multiset_intersection a b) b)
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection (Multiset_intersection a b) b))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=
    (Multiset_intersection a (Multiset_intersection a b))
    (Multiset_intersection a b))
  :pattern ((Multiset_intersection a (Multiset_intersection a b)))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>) (o $Ref)) (!
  (=
    (Multiset_count (Multiset_difference a b) o)
    (ite
      (< (- (Multiset_count a o) (Multiset_count b o)) 0)
      0
      (- (Multiset_count a o) (Multiset_count b o))))
  :pattern ((Multiset_count (Multiset_difference a b) o))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>) (y $Ref)) (!
  (=>
    (<= (Multiset_count a y) (Multiset_count b y))
    (= (Multiset_count (Multiset_difference a b) y) 0))
  :pattern ((Multiset_difference a b) (Multiset_count b y) (Multiset_count a y))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
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
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=
    (Multiset_subset a b)
    (forall ((o $Ref)) (!
      (<= (Multiset_count a o) (Multiset_count b o))
      :pattern ((Multiset_count a o))
      :pattern ((Multiset_count b o))
      )))
  :pattern ((Multiset_subset a b))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
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
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=> (Multiset_equal a b) (= a b))
  :pattern ((Multiset_equal a b))
  )))
(assert (forall ((a Multiset<$Ref>) (b Multiset<$Ref>)) (!
  (=
    (Multiset_disjoint a b)
    (forall ((o $Ref)) (!
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
; ---------- LockSet__LockSet ----------
(declare-const current_thread_id@0@01 Int)
(declare-const sys__result@1@01 $Ref)
(declare-const current_thread_id@2@01 Int)
(declare-const sys__result@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@2@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.first $t@5@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@3@01 $Ref.null)))
; [eval] Multiset[Ref]()
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@6@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@7@01 $Ref)
(assert (not (= diz@7@01 $Ref.null)))
(assert (not (= diz@7@01 diz@6@01)))
(assert (not (= diz@7@01 sys__result@3@01)))
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Lock__lock ----------
(declare-const diz@8@01 $Ref)
(declare-const current_thread_id@9@01 Int)
(declare-const S@10@01 Multiset<$Ref>)
(declare-const diz@11@01 $Ref)
(declare-const current_thread_id@12@01 Int)
(declare-const S@13@01 Multiset<$Ref>)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@12@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (<= $Perm.No $k@15@01))
(assert (<= $k@15@01 $Perm.Write))
(assert (=> (< $Perm.No $k@15@01) (not (= diz@11@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@14@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@14@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@14@01)))))))
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (<= $Perm.No $k@16@01))
(assert (<= $k@16@01 $Perm.Write))
(assert (=> (< $Perm.No $k@16@01) (not (= diz@11@01 $Ref.null))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(declare-const $k@18@01 $Perm)
(assert ($Perm.isReadVar $k@18@01))
(assert (<= $Perm.No $k@18@01))
(assert (<= $k@18@01 $Perm.Write))
(assert (=> (< $Perm.No $k@18@01) (not (= diz@11@01 $Ref.null))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(assert (<= $Perm.No $k@19@01))
(assert (<= $k@19@01 $Perm.Write))
(assert (=> (< $Perm.No $k@19@01) (not (= diz@11@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
; [eval] (diz in S) == 0
; [eval] (diz in S)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Multiset_count S@13@01 diz@11@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Multiset_count S@13@01 diz@11@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | S@13@01(diz@11@01) == 0 | live]
; [else-branch: 0 | S@13@01(diz@11@01) != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | S@13@01(diz@11@01) == 0]
(assert (= (Multiset_count S@13@01 diz@11@01) 0))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@19@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | S@13@01(diz@11@01) != 0]
(assert (not (= (Multiset_count S@13@01 diz@11@01) 0)))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@17@01))) $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
(pop) ; 3
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Lock__unlock ----------
(declare-const diz@20@01 $Ref)
(declare-const current_thread_id@21@01 Int)
(declare-const S@22@01 Multiset<$Ref>)
(declare-const diz@23@01 $Ref)
(declare-const current_thread_id@24@01 Int)
(declare-const S@25@01 Multiset<$Ref>)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@23@01 $Ref.null)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@24@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(assert (<= $Perm.No $k@27@01))
(assert (<= $k@27@01 $Perm.Write))
(assert (=> (< $Perm.No $k@27@01) (not (= diz@23@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(declare-const $k@28@01 $Perm)
(assert ($Perm.isReadVar $k@28@01))
(assert (<= $Perm.No $k@28@01))
(assert (<= $k@28@01 $Perm.Write))
(assert (=> (< $Perm.No $k@28@01) (not (= diz@23@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@27@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
; [eval] (diz in S) == 0
; [eval] (diz in S)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= (Multiset_count S@25@01 diz@23@01) 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Multiset_count S@25@01 diz@23@01) 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | S@25@01(diz@23@01) == 0 | live]
; [else-branch: 1 | S@25@01(diz@23@01) != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 1 | S@25@01(diz@23@01) == 0]
(assert (= (Multiset_count S@25@01 diz@23@01) 0))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@28@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(declare-const $k@30@01 $Perm)
(assert ($Perm.isReadVar $k@30@01))
(assert (<= $Perm.No $k@30@01))
(assert (<= $k@30@01 $Perm.Write))
(assert (=> (< $Perm.No $k@30@01) (not (= diz@23@01 $Ref.null))))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(declare-const $k@31@01 $Perm)
(assert ($Perm.isReadVar $k@31@01))
(assert (<= $Perm.No $k@31@01))
(assert (<= $k@31@01 $Perm.Write))
(assert (=> (< $Perm.No $k@31@01) (not (= diz@23@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 1 | S@25@01(diz@23@01) != 0]
(assert (not (= (Multiset_count S@25@01 diz@23@01) 0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(declare-const $k@33@01 $Perm)
(assert ($Perm.isReadVar $k@33@01))
(assert (<= $Perm.No $k@33@01))
(assert (<= $k@33@01 $Perm.Write))
(assert (=> (< $Perm.No $k@33@01) (not (= diz@23@01 $Ref.null))))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(assert (<= $Perm.No $k@34@01))
(assert (<= $k@34@01 $Perm.Write))
(assert (=> (< $Perm.No $k@34@01) (not (= diz@23@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@33@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Lock__Lock ----------
(declare-const current_thread_id@35@01 Int)
(declare-const owner@36@01 $Ref)
(declare-const user@37@01 $Ref)
(declare-const sys__result@38@01 $Ref)
(declare-const current_thread_id@39@01 Int)
(declare-const owner@40@01 $Ref)
(declare-const user@41@01 $Ref)
(declare-const sys__result@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(assert (= ($Snap.first $t@43@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@39@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(assert (= ($Snap.first $t@44@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@42@01 $Ref.null)))
(assert (=
  ($Snap.second $t@44@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@44@01))
    ($Snap.second ($Snap.second $t@44@01)))))
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(assert (<= $Perm.No $k@45@01))
(assert (<= $k@45@01 $Perm.Write))
(assert (=> (< $Perm.No $k@45@01) (not (= sys__result@42@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@44@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@44@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@44@01))))))
(declare-const $k@46@01 $Perm)
(assert ($Perm.isReadVar $k@46@01))
(assert (<= $Perm.No $k@46@01))
(assert (<= $k@46@01 $Perm.Write))
(assert (=> (< $Perm.No $k@46@01) (not (= sys__result@42@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@44@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  $Snap.unit))
; [eval] sys__result.Lock__owner == owner
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@45@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@44@01))) owner@40@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@44@01))))
  $Snap.unit))
; [eval] sys__result.Lock__user == user
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@46@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@44@01))))
  user@41@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@47@01 $Ref)
; [exec]
; diz := new(Lock__owner, Lock__user)
(declare-const diz@48@01 $Ref)
(assert (not (= diz@48@01 $Ref.null)))
(declare-const Lock__owner@49@01 $Ref)
(declare-const Lock__user@50@01 $Ref)
(assert (not (= diz@48@01 sys__result@42@01)))
(assert (not (= diz@48@01 user@41@01)))
(assert (not (= diz@48@01 diz@47@01)))
(assert (not (= diz@48@01 owner@40@01)))
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Client__main ----------
(declare-const diz@51@01 $Ref)
(declare-const current_thread_id@52@01 Int)
(declare-const diz@53@01 $Ref)
(declare-const current_thread_id@54@01 Int)
(push) ; 1
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@53@01 $Ref.null)))
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (= ($Snap.first ($Snap.second $t@55@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@54@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var ls: Ref
(declare-const ls@56@01 $Ref)
; [exec]
; var __flatten_1: Ref
(declare-const __flatten_1@57@01 $Ref)
; [exec]
; var l: Ref
(declare-const l@58@01 $Ref)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@59@01 $Ref)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@60@01 Int)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@61@01 Int)
; [exec]
; var __flatten_8: Int
(declare-const __flatten_8@62@01 Int)
; [exec]
; var __flatten_10: Int
(declare-const __flatten_10@63@01 Int)
; [exec]
; var __flatten_15: Int
(declare-const __flatten_15@64@01 Int)
; [exec]
; var __flatten_17: Int
(declare-const __flatten_17@65@01 Int)
; [exec]
; var __flatten_19: Int
(declare-const __flatten_19@66@01 Int)
; [exec]
; var __flatten_21: Int
(declare-const __flatten_21@67@01 Int)
; [exec]
; __flatten_1 := LockSet__LockSet(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@68@01 $Ref)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
(assert (= ($Snap.first $t@69@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@68@01 $Ref.null)))
; [eval] Multiset[Ref]()
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; ls := __flatten_1
; [exec]
; assert acc(LockSet__lockset(ls, Multiset[Ref]()), write)
; [eval] Multiset[Ref]()
; [exec]
; fold acc(Client__inv(diz, write), write)
; [eval] p >= none
(assert (Client__inv%trigger ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second $t@55@01))) diz@53@01 $Perm.Write))
; [exec]
; __flatten_2 := Lock__Lock(current_thread_id, ls, diz)
; [eval] current_thread_id >= 0
(declare-const sys__result@70@01 $Ref)
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(assert (= ($Snap.first $t@71@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@70@01 $Ref.null)))
(assert (=
  ($Snap.second $t@71@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@71@01))
    ($Snap.second ($Snap.second $t@71@01)))))
(declare-const $k@72@01 $Perm)
(assert ($Perm.isReadVar $k@72@01))
(assert (<= $Perm.No $k@72@01))
(assert (<= $k@72@01 $Perm.Write))
(assert (=> (< $Perm.No $k@72@01) (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@71@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@71@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@71@01))))))
(declare-const $k@73@01 $Perm)
(assert ($Perm.isReadVar $k@73@01))
(assert (<= $Perm.No $k@73@01))
(assert (<= $k@73@01 $Perm.Write))
(assert (=> (< $Perm.No $k@73@01) (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@71@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@71@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@71@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@71@01))))
  $Snap.unit))
; [eval] sys__result.Lock__owner == owner
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@71@01)))
  sys__result@68@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@71@01))))
  $Snap.unit))
; [eval] sys__result.Lock__user == user
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@73@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@71@01))))
  diz@53@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; l := __flatten_2
; [exec]
; Lock__lock(l, current_thread_id, Multiset[Ref]())
; [eval] Multiset[Ref]()
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@74@01 $Perm)
(assert ($Perm.isReadVar $k@74@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@72@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@74@01 $k@72@01))
(assert (<= $Perm.No (- $k@72@01 $k@74@01)))
(assert (<= (- $k@72@01 $k@74@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@72@01 $k@74@01)) (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@74@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@73@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@75@01 $k@73@01))
(assert (<= $Perm.No (- $k@73@01 $k@75@01)))
(assert (<= (- $k@73@01 $k@75@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@73@01 $k@75@01)) (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@75@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  sys__result@68@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@71@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(declare-const $k@77@01 $Perm)
(assert ($Perm.isReadVar $k@77@01))
(declare-const $t@78@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- $k@72@01 $k@74@01))
    (=
      $t@78@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@71@01)))))
  (=>
    (< $Perm.No $k@77@01)
    (= $t@78@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@76@01))))))
(assert (<= $Perm.No (+ (- $k@72@01 $k@74@01) $k@77@01)))
(assert (<= (+ (- $k@72@01 $k@74@01) $k@77@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- $k@72@01 $k@74@01) $k@77@01))
  (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(declare-const $k@79@01 $Perm)
(assert ($Perm.isReadVar $k@79@01))
(declare-const $t@80@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- $k@73@01 $k@75@01))
    (=
      $t@80@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@71@01))))))
  (=>
    (< $Perm.No $k@79@01)
    (=
      $t@80@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@76@01)))))))
(assert (<= $Perm.No (+ (- $k@73@01 $k@75@01) $k@79@01)))
(assert (<= (+ (- $k@73@01 $k@75@01) $k@79@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- $k@73@01 $k@75@01) $k@79@01))
  (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
; [eval] (diz in S) == 0
; [eval] (diz in S)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= (Multiset_count (as Multiset_empty  Multiset<$Ref>) sys__result@70@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Multiset_count (as Multiset_empty  Multiset<$Ref>) sys__result@70@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | Ø(sys__result@70@01) == 0 | live]
; [else-branch: 2 | Ø(sys__result@70@01) != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | Ø(sys__result@70@01) == 0]
(assert (= (Multiset_count (as Multiset_empty  Multiset<$Ref>) sys__result@70@01) 0))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- $k@73@01 $k@75@01) $k@79@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- $k@72@01 $k@74@01) $k@77@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(Client__inv(diz, write), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= $t@80@01 diz@53@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@76@01)))))))
(assert (= ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@76@01)))) $Snap.unit))
; [eval] p >= none
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Client__inv%trigger ($Snap.first ($Snap.second ($Snap.second $t@76@01))) diz@53@01 $Perm.Write))
; [exec]
; __flatten_4 := 1
; [exec]
; __flatten_15 := __flatten_4
; [exec]
; diz.Client__x := __flatten_15
; [exec]
; Lock__lock(l, current_thread_id, Multiset(l))
; [eval] Multiset(l)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@81@01 $Perm)
(assert ($Perm.isReadVar $k@81@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@72@01 $k@74@01) $k@77@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@81@01 (+ (- $k@72@01 $k@74@01) $k@77@01)))
(assert (<= $Perm.No (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01)))
(assert (<= (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@81@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@82@01 $Perm)
(assert ($Perm.isReadVar $k@82@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@73@01 $k@75@01) $k@79@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@82@01 (+ (- $k@73@01 $k@75@01) $k@79@01)))
(assert (<= $Perm.No (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01)))
(assert (<= (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@82@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- $k@72@01 $k@74@01) $k@77@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Multiset_equal (Multiset_union (as Multiset_empty  Multiset<$Ref>) (Multiset_singleton sys__result@70@01)) (Multiset_singleton sys__result@70@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(declare-const $k@84@01 $Perm)
(assert ($Perm.isReadVar $k@84@01))
(declare-const $t@85@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01))
    (= $t@85@01 $t@78@01))
  (=>
    (< $Perm.No $k@84@01)
    (= $t@85@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@83@01))))))
(assert (<= $Perm.No (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01)))
(assert (<= (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01))
  (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second $t@83@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@83@01))
    ($Snap.second ($Snap.second $t@83@01)))))
(declare-const $k@86@01 $Perm)
(assert ($Perm.isReadVar $k@86@01))
(declare-const $t@87@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01))
    (= $t@87@01 $t@80@01))
  (=>
    (< $Perm.No $k@86@01)
    (=
      $t@87@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@83@01)))))))
(assert (<= $Perm.No (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01)))
(assert (<= (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01))
  (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@83@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@83@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@83@01))))))
; [eval] (diz in S) == 0
; [eval] (diz in S)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (= (Multiset_count (Multiset_singleton sys__result@70@01) sys__result@70@01) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | {sys__result@70@01}(sys__result@70@01) == 0 | dead]
; [else-branch: 3 | {sys__result@70@01}(sys__result@70@01) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | {sys__result@70@01}(sys__result@70@01) != 0]
(assert (not
  (= (Multiset_count (Multiset_singleton sys__result@70@01) sys__result@70@01) 0)))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@83@01))) $Snap.unit))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_6 := 2
; [exec]
; __flatten_17 := __flatten_6
; [exec]
; diz.Client__x := __flatten_17
; [exec]
; Lock__unlock(l, current_thread_id, Multiset(l))
; [eval] Multiset(l)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@88@01 (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01)))
(assert (<=
  $Perm.No
  (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)))
(assert (<=
  (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@88@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (< $k@89@01 (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01)))
(assert (<=
  $Perm.No
  (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)))
(assert (<=
  (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@89@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
; [eval] (diz in S) == 0
; [eval] (diz in S)
; [then-branch: 4 | {sys__result@70@01}(sys__result@70@01) == 0 | dead]
; [else-branch: 4 | {sys__result@70@01}(sys__result@70@01) != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | {sys__result@70@01}(sys__result@70@01) != 0]
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 ($Snap.combine ($Snap.first $t@90@01) ($Snap.second $t@90@01))))
(declare-const $k@91@01 $Perm)
(assert ($Perm.isReadVar $k@91@01))
(declare-const $t@92@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01))
    (= $t@92@01 $t@85@01))
  (=>
    (< $Perm.No $k@91@01)
    (= $t@92@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@90@01))))))
(assert (<=
  $Perm.No
  (+
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
    $k@91@01)))
(assert (<=
  (+
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
    $k@91@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
      $k@91@01))
  (not (= sys__result@70@01 $Ref.null))))
(assert (=
  ($Snap.second $t@90@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@90@01))
    ($Snap.second ($Snap.second $t@90@01)))))
(declare-const $k@93@01 $Perm)
(assert ($Perm.isReadVar $k@93@01))
(declare-const $t@94@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01))
    (= $t@94@01 $t@87@01))
  (=>
    (< $Perm.No $k@93@01)
    (=
      $t@94@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@90@01)))))))
(assert (<=
  $Perm.No
  (+
    (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
    $k@93@01)))
(assert (<=
  (+
    (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
    $k@93@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
      $k@93@01))
  (not (= sys__result@70@01 $Ref.null))))
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
    $k@91@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_8 := 3
; [exec]
; __flatten_19 := __flatten_8
; [exec]
; diz.Client__x := __flatten_19
; [exec]
; fold acc(Client__inv(diz, write), write)
; [eval] p >= none
(assert (Client__inv%trigger ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap 3)) diz@53@01 $Perm.Write))
; [exec]
; Lock__unlock(l, current_thread_id, Multiset[Ref]())
; [eval] Multiset[Ref]()
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const $k@95@01 $Perm)
(assert ($Perm.isReadVar $k@95@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    (+
      (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
      $k@91@01)
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  $k@95@01
  (+
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
    $k@91@01)))
(assert (<=
  $Perm.No
  (-
    (+
      (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
      $k@91@01)
    $k@95@01)))
(assert (<=
  (-
    (+
      (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
      $k@91@01)
    $k@95@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
        $k@91@01)
      $k@95@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@95@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $k@96@01 $Perm)
(assert ($Perm.isReadVar $k@96@01))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    (+
      (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
      $k@93@01)
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  $k@96@01
  (+
    (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
    $k@93@01)))
(assert (<=
  $Perm.No
  (-
    (+
      (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
      $k@93@01)
    $k@96@01)))
(assert (<=
  (-
    (+
      (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
      $k@93@01)
    $k@96@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (- (+ (- (+ (- $k@73@01 $k@75@01) $k@79@01) $k@82@01) $k@86@01) $k@89@01)
        $k@93@01)
      $k@96@01))
  (not (= sys__result@70@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@96@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (- (+ (- $k@72@01 $k@74@01) $k@77@01) $k@81@01) $k@84@01) $k@88@01)
    $k@91@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (S union Multiset(diz))
; [eval] Multiset(diz)
; ---------- Client__Client ----------
(declare-const current_thread_id@97@01 Int)
(declare-const sys__result@98@01 $Ref)
(declare-const current_thread_id@99@01 Int)
(declare-const sys__result@100@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(declare-const $t@101@01 $Snap)
