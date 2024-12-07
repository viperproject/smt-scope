(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:00:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0068.vpr
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
(declare-sort Set<$Ref> 0)
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
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
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
; ---------- test1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const ys@1@01 Set<$Ref>)
(declare-const zs@2@01 Set<$Ref>)
(declare-const xs@3@01 Set<$Ref>)
(declare-const ys@4@01 Set<$Ref>)
(declare-const zs@5@01 Set<$Ref>)
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
; inhale (xs intersection ys) == zs
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (xs intersection ys) == zs
; [eval] (xs intersection ys)
(assert (Set_equal (Set_intersection xs@3@01 ys@4@01) zs@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (ys intersection xs) == zs
; [eval] (ys intersection xs) == zs
; [eval] (ys intersection xs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_intersection ys@4@01 xs@3@01) zs@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_intersection ys@4@01 xs@3@01) zs@5@01))
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const xs@7@01 Set<$Ref>)
(declare-const ys@8@01 Set<$Ref>)
(declare-const zs@9@01 Set<$Ref>)
(declare-const as@10@01 Set<$Ref>)
(declare-const xs@11@01 Set<$Ref>)
(declare-const ys@12@01 Set<$Ref>)
(declare-const zs@13@01 Set<$Ref>)
(declare-const as@14@01 Set<$Ref>)
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
; inhale ((xs intersection ys) intersection zs) == as
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] ((xs intersection ys) intersection zs) == as
; [eval] ((xs intersection ys) intersection zs)
; [eval] (xs intersection ys)
(assert (Set_equal (Set_intersection (Set_intersection xs@11@01 ys@12@01) zs@13@01) as@14@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert ((zs intersection ys) intersection xs) == as
; [eval] ((zs intersection ys) intersection xs) == as
; [eval] ((zs intersection ys) intersection xs)
; [eval] (zs intersection ys)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_intersection (Set_intersection zs@13@01 ys@12@01) xs@11@01) as@14@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_intersection (Set_intersection zs@13@01 ys@12@01) xs@11@01) as@14@01))
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const xs@16@01 Set<$Ref>)
(declare-const ys@17@01 Set<$Ref>)
(declare-const zs@18@01 Set<$Ref>)
(declare-const as@19@01 Set<$Ref>)
(declare-const xs@20@01 Set<$Ref>)
(declare-const ys@21@01 Set<$Ref>)
(declare-const zs@22@01 Set<$Ref>)
(declare-const as@23@01 Set<$Ref>)
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
; inhale ((xs intersection ys) intersection zs) == as
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] ((xs intersection ys) intersection zs) == as
; [eval] ((xs intersection ys) intersection zs)
; [eval] (xs intersection ys)
(assert (Set_equal (Set_intersection (Set_intersection xs@20@01 ys@21@01) zs@22@01) as@23@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert ((xs intersection zs) intersection ys) == as
; [eval] ((xs intersection zs) intersection ys) == as
; [eval] ((xs intersection zs) intersection ys)
; [eval] (xs intersection zs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_intersection (Set_intersection xs@20@01 zs@22@01) ys@21@01) as@23@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_intersection (Set_intersection xs@20@01 zs@22@01) ys@21@01) as@23@01))
(pop) ; 2
(pop) ; 1
; ---------- test13 ----------
(declare-const xs@25@01 Set<$Ref>)
(declare-const ys@26@01 Set<$Ref>)
(declare-const zs@27@01 Set<$Ref>)
(declare-const as@28@01 Set<$Ref>)
(declare-const xs@29@01 Set<$Ref>)
(declare-const ys@30@01 Set<$Ref>)
(declare-const zs@31@01 Set<$Ref>)
(declare-const as@32@01 Set<$Ref>)
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
; inhale ((xs intersection ys) intersection zs) == as
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] ((xs intersection ys) intersection zs) == as
; [eval] ((xs intersection ys) intersection zs)
; [eval] (xs intersection ys)
(assert (Set_equal (Set_intersection (Set_intersection xs@29@01 ys@30@01) zs@31@01) as@32@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (xs intersection (zs intersection ys)) == as
; [eval] (xs intersection (zs intersection ys)) == as
; [eval] (xs intersection (zs intersection ys))
; [eval] (zs intersection ys)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_intersection xs@29@01 (Set_intersection zs@31@01 ys@30@01)) as@32@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_intersection xs@29@01 (Set_intersection zs@31@01 ys@30@01)) as@32@01))
(pop) ; 2
(pop) ; 1
; ---------- test14 ----------
(declare-const xs@34@01 Set<$Ref>)
(declare-const ys@35@01 Set<$Ref>)
(declare-const zs@36@01 Set<$Ref>)
(declare-const as@37@01 Set<$Ref>)
(declare-const xs@38@01 Set<$Ref>)
(declare-const ys@39@01 Set<$Ref>)
(declare-const zs@40@01 Set<$Ref>)
(declare-const as@41@01 Set<$Ref>)
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
; inhale ((xs intersection ys) intersection zs) == as
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] ((xs intersection ys) intersection zs) == as
; [eval] ((xs intersection ys) intersection zs)
; [eval] (xs intersection ys)
(assert (Set_equal (Set_intersection (Set_intersection xs@38@01 ys@39@01) zs@40@01) as@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (ys intersection (zs intersection xs)) == as
; [eval] (ys intersection (zs intersection xs)) == as
; [eval] (ys intersection (zs intersection xs))
; [eval] (zs intersection xs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_intersection ys@39@01 (Set_intersection zs@40@01 xs@38@01)) as@41@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_intersection ys@39@01 (Set_intersection zs@40@01 xs@38@01)) as@41@01))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const xs@43@01 Set<$Ref>)
(declare-const ys@44@01 Set<$Ref>)
(declare-const zs@45@01 Set<$Ref>)
(declare-const xs@46@01 Set<$Ref>)
(declare-const ys@47@01 Set<$Ref>)
(declare-const zs@48@01 Set<$Ref>)
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
; inhale (xs union ys) == zs
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] (xs union ys) == zs
; [eval] (xs union ys)
(assert (Set_equal (Set_union xs@46@01 ys@47@01) zs@48@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (ys union xs) == zs
; [eval] (ys union xs) == zs
; [eval] (ys union xs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_union ys@47@01 xs@46@01) zs@48@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_union ys@47@01 xs@46@01) zs@48@01))
(pop) ; 2
(pop) ; 1
; ---------- test21 ----------
(declare-const xs@50@01 Set<$Ref>)
(declare-const ys@51@01 Set<$Ref>)
(declare-const zs@52@01 Set<$Ref>)
(declare-const as@53@01 Set<$Ref>)
(declare-const xs@54@01 Set<$Ref>)
(declare-const ys@55@01 Set<$Ref>)
(declare-const zs@56@01 Set<$Ref>)
(declare-const as@57@01 Set<$Ref>)
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
; inhale ((xs union ys) union zs) == as
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] ((xs union ys) union zs) == as
; [eval] ((xs union ys) union zs)
; [eval] (xs union ys)
(assert (Set_equal (Set_union (Set_union xs@54@01 ys@55@01) zs@56@01) as@57@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert ((zs union ys) union xs) == as
; [eval] ((zs union ys) union xs) == as
; [eval] ((zs union ys) union xs)
; [eval] (zs union ys)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_union (Set_union zs@56@01 ys@55@01) xs@54@01) as@57@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_union (Set_union zs@56@01 ys@55@01) xs@54@01) as@57@01))
(pop) ; 2
(pop) ; 1
; ---------- test22 ----------
(declare-const xs@59@01 Set<$Ref>)
(declare-const ys@60@01 Set<$Ref>)
(declare-const zs@61@01 Set<$Ref>)
(declare-const as@62@01 Set<$Ref>)
(declare-const xs@63@01 Set<$Ref>)
(declare-const ys@64@01 Set<$Ref>)
(declare-const zs@65@01 Set<$Ref>)
(declare-const as@66@01 Set<$Ref>)
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
; inhale ((xs union ys) union zs) == as
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] ((xs union ys) union zs) == as
; [eval] ((xs union ys) union zs)
; [eval] (xs union ys)
(assert (Set_equal (Set_union (Set_union xs@63@01 ys@64@01) zs@65@01) as@66@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert ((xs union zs) union ys) == as
; [eval] ((xs union zs) union ys) == as
; [eval] ((xs union zs) union ys)
; [eval] (xs union zs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_union (Set_union xs@63@01 zs@65@01) ys@64@01) as@66@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_union (Set_union xs@63@01 zs@65@01) ys@64@01) as@66@01))
(pop) ; 2
(pop) ; 1
; ---------- test23 ----------
(declare-const xs@68@01 Set<$Ref>)
(declare-const ys@69@01 Set<$Ref>)
(declare-const zs@70@01 Set<$Ref>)
(declare-const as@71@01 Set<$Ref>)
(declare-const xs@72@01 Set<$Ref>)
(declare-const ys@73@01 Set<$Ref>)
(declare-const zs@74@01 Set<$Ref>)
(declare-const as@75@01 Set<$Ref>)
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
; inhale ((xs union ys) union zs) == as
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 $Snap.unit))
; [eval] ((xs union ys) union zs) == as
; [eval] ((xs union ys) union zs)
; [eval] (xs union ys)
(assert (Set_equal (Set_union (Set_union xs@72@01 ys@73@01) zs@74@01) as@75@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (xs union (zs union ys)) == as
; [eval] (xs union (zs union ys)) == as
; [eval] (xs union (zs union ys))
; [eval] (zs union ys)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_union xs@72@01 (Set_union zs@74@01 ys@73@01)) as@75@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_union xs@72@01 (Set_union zs@74@01 ys@73@01)) as@75@01))
(pop) ; 2
(pop) ; 1
; ---------- test24 ----------
(declare-const xs@77@01 Set<$Ref>)
(declare-const ys@78@01 Set<$Ref>)
(declare-const zs@79@01 Set<$Ref>)
(declare-const as@80@01 Set<$Ref>)
(declare-const xs@81@01 Set<$Ref>)
(declare-const ys@82@01 Set<$Ref>)
(declare-const zs@83@01 Set<$Ref>)
(declare-const as@84@01 Set<$Ref>)
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
; inhale ((xs union ys) union zs) == as
(declare-const $t@85@01 $Snap)
(assert (= $t@85@01 $Snap.unit))
; [eval] ((xs union ys) union zs) == as
; [eval] ((xs union ys) union zs)
; [eval] (xs union ys)
(assert (Set_equal (Set_union (Set_union xs@81@01 ys@82@01) zs@83@01) as@84@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (ys union (zs union xs)) == as
; [eval] (ys union (zs union xs)) == as
; [eval] (ys union (zs union xs))
; [eval] (zs union xs)
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (Set_union ys@82@01 (Set_union zs@83@01 xs@81@01)) as@84@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal (Set_union ys@82@01 (Set_union zs@83@01 xs@81@01)) as@84@01))
(pop) ; 2
(pop) ; 1
