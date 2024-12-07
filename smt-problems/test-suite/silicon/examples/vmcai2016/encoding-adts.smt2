(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:10:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr
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
(declare-sort list 0)
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
(declare-fun $SortWrappers.listTo$Snap (list) $Snap)
(declare-fun $SortWrappers.$SnapTolist ($Snap) list)
(assert (forall ((x list)) (!
    (= x ($SortWrappers.$SnapTolist($SortWrappers.listTo$Snap x)))
    :pattern (($SortWrappers.listTo$Snap x))
    :qid |$Snap.$SnapTolistTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.listTo$Snap($SortWrappers.$SnapTolist x)))
    :pattern (($SortWrappers.$SnapTolist x))
    :qid |$Snap.listTo$SnapTolist|
    )))
; ////////// Symbols
(declare-const Nil<list> list)
(declare-fun Cons<list> (Int list) list)
(declare-fun head_Cons<Int> (list) Int)
(declare-fun tail_Cons<list> (list) list)
(declare-fun type<Int> (list) Int)
(declare-const type_Nil<Int> Int)
(declare-const type_Cons<Int> Int)
(declare-fun is_Nil<Bool> (list) Bool)
(declare-fun is_Cons<Bool> (list) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
(assert (distinct type_Nil<Int> type_Cons<Int>))
; ////////// Axioms
(assert (forall ((head Int) (tail list)) (!
  (and
    (= (head_Cons<Int> (Cons<list> head tail)) head)
    (= (tail_Cons<list> (Cons<list> head tail)) tail))
  :pattern ((Cons<list> head tail))
  :qid |prog.destruct_over_construct_Cons|)))
(assert (forall ((xs list)) (!
  (=>
    (is_Cons<Bool> xs)
    (= xs (Cons<list> (head_Cons<Int> xs) (tail_Cons<list> xs))))
  :pattern ((head_Cons<Int> xs))
  :pattern ((tail_Cons<list> xs))
  :qid |prog.construct_over_destruct_Cons|)))
(assert (= (type<Int> (as Nil<list>  list)) (as type_Nil<Int>  Int)))
(assert (forall ((head Int) (tail list)) (!
  (= (type<Int> (Cons<list> head tail)) (as type_Cons<Int>  Int))
  :pattern ((type<Int> (Cons<list> head tail)))
  :qid |prog.type_of_Cons|)))
(assert (forall ((xs list)) (!
  (or
    (= (type<Int> xs) (as type_Nil<Int>  Int))
    (= (type<Int> xs) (as type_Cons<Int>  Int)))
  :pattern ((type<Int> xs))
  :qid |prog.type_existence|)))
(assert (forall ((xs list)) (!
  (= (= (type<Int> xs) (as type_Nil<Int>  Int)) (is_Nil<Bool> xs))
  :pattern ((type<Int> xs))
  :pattern ((is_Nil<Bool> xs))
  :qid |prog.type_is_Nil|)))
(assert (forall ((xs list)) (!
  (= (= (type<Int> xs) (as type_Cons<Int>  Int)) (is_Cons<Bool> xs))
  :pattern ((type<Int> xs))
  :pattern ((is_Cons<Bool> xs))
  :qid |prog.type_IsElem|)))
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
; ---------- test_types ----------
(declare-const x@0@01 list)
(declare-const x@1@01 list)
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
; assert is_Nil(x) == !is_Cons(x)
; [eval] is_Nil(x) == !is_Cons(x)
; [eval] is_Nil(x)
; [eval] !is_Cons(x)
; [eval] is_Cons(x)
(push) ; 3
(assert (not (= (is_Nil<Bool> x@1@01) (not (is_Cons<Bool> x@1@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (is_Nil<Bool> x@1@01) (not (is_Cons<Bool> x@1@01))))
(pop) ; 2
(pop) ; 1
; ---------- test_quantifiers ----------
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
; assert (forall head: Int, tail: list, xs: list ::
;     { is_Cons(xs), Cons(head, tail) }
;     { head_Cons(xs), Cons(head, tail) }
;     { tail_Cons(xs), Cons(head, tail) }
;     is_Cons(xs) ==>
;     (head == head_Cons(xs) && tail == tail_Cons(xs)) ==
;     (Cons(head, tail) == xs))
; [eval] (forall head: Int, tail: list, xs: list :: { is_Cons(xs), Cons(head, tail) } { head_Cons(xs), Cons(head, tail) } { tail_Cons(xs), Cons(head, tail) } is_Cons(xs) ==> (head == head_Cons(xs) && tail == tail_Cons(xs)) == (Cons(head, tail) == xs))
(declare-const head@2@01 Int)
(declare-const tail@3@01 list)
(declare-const xs@4@01 list)
(push) ; 3
; [eval] is_Cons(xs) ==> (head == head_Cons(xs) && tail == tail_Cons(xs)) == (Cons(head, tail) == xs)
; [eval] is_Cons(xs)
(push) ; 4
; [then-branch: 0 | is_Cons[Bool](xs@4@01) | live]
; [else-branch: 0 | !(is_Cons[Bool](xs@4@01)) | live]
(push) ; 5
; [then-branch: 0 | is_Cons[Bool](xs@4@01)]
(assert (is_Cons<Bool> xs@4@01))
; [eval] (head == head_Cons(xs) && tail == tail_Cons(xs)) == (Cons(head, tail) == xs)
; [eval] head == head_Cons(xs) && tail == tail_Cons(xs)
; [eval] head == head_Cons(xs)
; [eval] head_Cons(xs)
(push) ; 6
; [then-branch: 1 | head@2@01 != head_Cons[Int](xs@4@01) | live]
; [else-branch: 1 | head@2@01 == head_Cons[Int](xs@4@01) | live]
(push) ; 7
; [then-branch: 1 | head@2@01 != head_Cons[Int](xs@4@01)]
(assert (not (= head@2@01 (head_Cons<Int> xs@4@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | head@2@01 == head_Cons[Int](xs@4@01)]
(assert (= head@2@01 (head_Cons<Int> xs@4@01)))
; [eval] tail == tail_Cons(xs)
; [eval] tail_Cons(xs)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (= head@2@01 (head_Cons<Int> xs@4@01))
  (not (= head@2@01 (head_Cons<Int> xs@4@01)))))
; [eval] Cons(head, tail) == xs
; [eval] Cons(head, tail)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(is_Cons[Bool](xs@4@01))]
(assert (not (is_Cons<Bool> xs@4@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@4@01)
  (and
    (is_Cons<Bool> xs@4@01)
    (or
      (= head@2@01 (head_Cons<Int> xs@4@01))
      (not (= head@2@01 (head_Cons<Int> xs@4@01)))))))
; Joined path conditions
(assert (or (not (is_Cons<Bool> xs@4@01)) (is_Cons<Bool> xs@4@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((head@2@01 Int) (tail@3@01 list) (xs@4@01 list)) (!
  (and
    (=>
      (is_Cons<Bool> xs@4@01)
      (and
        (is_Cons<Bool> xs@4@01)
        (or
          (= head@2@01 (head_Cons<Int> xs@4@01))
          (not (= head@2@01 (head_Cons<Int> xs@4@01))))))
    (or (not (is_Cons<Bool> xs@4@01)) (is_Cons<Bool> xs@4@01)))
  :pattern ((is_Cons<Bool> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@78@12@79@99-aux|)))
(assert (forall ((head@2@01 Int) (tail@3@01 list) (xs@4@01 list)) (!
  (and
    (=>
      (is_Cons<Bool> xs@4@01)
      (and
        (is_Cons<Bool> xs@4@01)
        (or
          (= head@2@01 (head_Cons<Int> xs@4@01))
          (not (= head@2@01 (head_Cons<Int> xs@4@01))))))
    (or (not (is_Cons<Bool> xs@4@01)) (is_Cons<Bool> xs@4@01)))
  :pattern ((head_Cons<Int> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@78@12@79@99-aux|)))
(assert (forall ((head@2@01 Int) (tail@3@01 list) (xs@4@01 list)) (!
  (and
    (=>
      (is_Cons<Bool> xs@4@01)
      (and
        (is_Cons<Bool> xs@4@01)
        (or
          (= head@2@01 (head_Cons<Int> xs@4@01))
          (not (= head@2@01 (head_Cons<Int> xs@4@01))))))
    (or (not (is_Cons<Bool> xs@4@01)) (is_Cons<Bool> xs@4@01)))
  :pattern ((tail_Cons<list> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@78@12@79@99-aux|)))
(push) ; 3
(assert (not (forall ((head@2@01 Int) (tail@3@01 list) (xs@4@01 list)) (!
  (=>
    (is_Cons<Bool> xs@4@01)
    (=
      (and
        (= head@2@01 (head_Cons<Int> xs@4@01))
        (= tail@3@01 (tail_Cons<list> xs@4@01)))
      (= (Cons<list> head@2@01 tail@3@01) xs@4@01)))
  :pattern ((is_Cons<Bool> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :pattern ((head_Cons<Int> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :pattern ((tail_Cons<list> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@78@12@79@99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((head@2@01 Int) (tail@3@01 list) (xs@4@01 list)) (!
  (=>
    (is_Cons<Bool> xs@4@01)
    (=
      (and
        (= head@2@01 (head_Cons<Int> xs@4@01))
        (= tail@3@01 (tail_Cons<list> xs@4@01)))
      (= (Cons<list> head@2@01 tail@3@01) xs@4@01)))
  :pattern ((is_Cons<Bool> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :pattern ((head_Cons<Int> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :pattern ((tail_Cons<list> xs@4@01) (Cons<list> head@2@01 tail@3@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@78@12@79@99|)))
; [exec]
; assert (forall head1: Int, head2: Int, tail1: list, tail2: list ::
;     { Cons(head1, tail1), Cons(head2, tail2) }
;     (Cons(head1, tail1) == Cons(head2, tail2)) ==
;     (head1 == head2 && tail1 == tail2))
; [eval] (forall head1: Int, head2: Int, tail1: list, tail2: list :: { Cons(head1, tail1), Cons(head2, tail2) } (Cons(head1, tail1) == Cons(head2, tail2)) == (head1 == head2 && tail1 == tail2))
(declare-const head1@5@01 Int)
(declare-const head2@6@01 Int)
(declare-const tail1@7@01 list)
(declare-const tail2@8@01 list)
(push) ; 3
; [eval] (Cons(head1, tail1) == Cons(head2, tail2)) == (head1 == head2 && tail1 == tail2)
; [eval] Cons(head1, tail1) == Cons(head2, tail2)
; [eval] Cons(head1, tail1)
; [eval] Cons(head2, tail2)
; [eval] head1 == head2 && tail1 == tail2
; [eval] head1 == head2
(push) ; 4
; [then-branch: 2 | head1@5@01 != head2@6@01 | live]
; [else-branch: 2 | head1@5@01 == head2@6@01 | live]
(push) ; 5
; [then-branch: 2 | head1@5@01 != head2@6@01]
(assert (not (= head1@5@01 head2@6@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | head1@5@01 == head2@6@01]
(assert (= head1@5@01 head2@6@01))
; [eval] tail1 == tail2
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= head1@5@01 head2@6@01) (not (= head1@5@01 head2@6@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((head1@5@01 Int) (head2@6@01 Int) (tail1@7@01 list) (tail2@8@01 list)) (!
  (or (= head1@5@01 head2@6@01) (not (= head1@5@01 head2@6@01)))
  :pattern ((Cons<list> head1@5@01 tail1@7@01) (Cons<list> head2@6@01 tail2@8@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@82@12@83@85-aux|)))
(push) ; 3
(assert (not (forall ((head1@5@01 Int) (head2@6@01 Int) (tail1@7@01 list) (tail2@8@01 list)) (!
  (=
    (= (Cons<list> head1@5@01 tail1@7@01) (Cons<list> head2@6@01 tail2@8@01))
    (and (= head1@5@01 head2@6@01) (= tail1@7@01 tail2@8@01)))
  :pattern ((Cons<list> head1@5@01 tail1@7@01) (Cons<list> head2@6@01 tail2@8@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@82@12@83@85|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((head1@5@01 Int) (head2@6@01 Int) (tail1@7@01 list) (tail2@8@01 list)) (!
  (=
    (= (Cons<list> head1@5@01 tail1@7@01) (Cons<list> head2@6@01 tail2@8@01))
    (and (= head1@5@01 head2@6@01) (= tail1@7@01 tail2@8@01)))
  :pattern ((Cons<list> head1@5@01 tail1@7@01) (Cons<list> head2@6@01 tail2@8@01))
  :qid |prog./silicon/silver/src/test/resources/examples/vmcai2016/encoding-adts.vpr@82@12@83@85|)))
(pop) ; 2
(pop) ; 1
; ---------- pattern_match_exhaustiveness_test ----------
(declare-const xs@9@01 list)
(declare-const xs@10@01 list)
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
; assert !is_Nil(xs) &&
;   (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) &&
;   !(is_Cons(xs) &&
;   (let y ==
;     (head_Cons(xs)) in
;     (let ys ==
;       (tail_Cons(xs)) in
;       is_Cons(ys))))) ==>
;   false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys))))) ==> false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys)))))
; [eval] !is_Nil(xs)
; [eval] is_Nil(xs)
(push) ; 3
; [then-branch: 3 | is_Nil[Bool](xs@10@01) | live]
; [else-branch: 3 | !(is_Nil[Bool](xs@10@01)) | live]
(push) ; 4
; [then-branch: 3 | is_Nil[Bool](xs@10@01)]
(assert (is_Nil<Bool> xs@10@01))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(is_Nil[Bool](xs@10@01))]
(assert (not (is_Nil<Bool> xs@10@01)))
; [eval] !(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys)))
; [eval] is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] is_Cons(xs)
(push) ; 5
; [then-branch: 4 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 4 | is_Cons[Bool](xs@10@01) | live]
(push) ; 6
; [then-branch: 4 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [eval] (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@11@01 list)
(assert (= (as letvar@11@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Nil(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@11@01  list) (tail_Cons<list> xs@10@01)))))
(assert (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01))))
(push) ; 5
; [then-branch: 5 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)) | live]
; [else-branch: 5 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) | live]
(push) ; 6
; [then-branch: 5 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))]
(assert (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
; [eval] !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys))))
; [eval] is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys)))
; [eval] is_Cons(xs)
(push) ; 7
; [then-branch: 6 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 6 | is_Cons[Bool](xs@10@01) | live]
(push) ; 8
; [then-branch: 6 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 6 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [eval] (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys)))
; [eval] head_Cons(xs)
(declare-const letvar@12@01 Int)
(assert (= (as letvar@12@01  Int) (head_Cons<Int> xs@10@01)))
; [eval] (let ys == (tail_Cons(xs)) in is_Cons(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@13@01 list)
(assert (= (as letvar@13@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Cons(ys)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@12@01  Int) (head_Cons<Int> xs@10@01))
    (= (as letvar@13@01  list) (tail_Cons<list> xs@10@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@12@01  Int) (head_Cons<Int> xs@10@01))
        (= (as letvar@13@01  list) (tail_Cons<list> xs@10@01)))))))
(assert (or
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@11@01  list) (tail_Cons<list> xs@10@01))))
    (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01)))
    (=>
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (=>
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> xs@10@01)
            (= (as letvar@12@01  Int) (head_Cons<Int> xs@10@01))
            (= (as letvar@13@01  list) (tail_Cons<list> xs@10@01))))))
    (or
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))))
(assert (or (not (is_Nil<Bool> xs@10@01)) (is_Nil<Bool> xs@10@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01))) | dead]
; [else-branch: 7 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)))) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01))))]
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
; [exec]
; assert !is_Nil(xs) &&
;   (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) &&
;   !(is_Cons(xs) &&
;   (let y ==
;     (head_Cons(xs)) in
;     (let ys ==
;       (tail_Cons(xs)) in
;       is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))) ==>
;   false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))) ==> false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))))
; [eval] !is_Nil(xs)
; [eval] is_Nil(xs)
(push) ; 3
; [then-branch: 8 | is_Nil[Bool](xs@10@01) | live]
; [else-branch: 8 | !(is_Nil[Bool](xs@10@01)) | live]
(push) ; 4
; [then-branch: 8 | is_Nil[Bool](xs@10@01)]
(assert (is_Nil<Bool> xs@10@01))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(is_Nil[Bool](xs@10@01))]
(assert (not (is_Nil<Bool> xs@10@01)))
; [eval] !(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys)))
; [eval] is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] is_Cons(xs)
(push) ; 5
; [then-branch: 9 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 9 | is_Cons[Bool](xs@10@01) | live]
(push) ; 6
; [then-branch: 9 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [eval] (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@14@01 list)
(assert (= (as letvar@14@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Nil(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@14@01  list) (tail_Cons<list> xs@10@01)))))
(assert (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01))))
(push) ; 5
; [then-branch: 10 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)) | live]
; [else-branch: 10 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) | live]
(push) ; 6
; [then-branch: 10 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))]
(assert (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
; [eval] !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))
; [eval] is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] is_Cons(xs)
(push) ; 7
; [then-branch: 11 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 11 | is_Cons[Bool](xs@10@01) | live]
(push) ; 8
; [then-branch: 11 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [eval] (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] head_Cons(xs)
(declare-const letvar@15@01 Int)
(assert (= (as letvar@15@01  Int) (head_Cons<Int> xs@10@01)))
; [eval] (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))
; [eval] tail_Cons(xs)
(declare-const letvar@16@01 list)
(assert (= (as letvar@16@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)
; [eval] is_Cons(ys)
(push) ; 9
; [then-branch: 12 | !(is_Cons[Bool](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 12 | is_Cons[Bool](tail_Cons[list](xs@10@01)) | live]
(push) ; 10
; [then-branch: 12 | !(is_Cons[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 12 | is_Cons[Bool](tail_Cons[list](xs@10@01))]
(assert (is_Cons<Bool> (tail_Cons<list> xs@10@01)))
; [eval] (let z == (head_Cons(ys)) in y < z)
; [eval] head_Cons(ys)
(declare-const letvar@17@01 Int)
(assert (= (as letvar@17@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))
; [eval] y < z
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (and
    (is_Cons<Bool> (tail_Cons<list> xs@10@01))
    (= (as letvar@17@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))))
(assert (or
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@15@01  Int) (head_Cons<Int> xs@10@01))
    (= (as letvar@16@01  list) (tail_Cons<list> xs@10@01))
    (=>
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (and
        (is_Cons<Bool> (tail_Cons<list> xs@10@01))
        (= (as letvar@17@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
    (or
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@15@01  Int) (head_Cons<Int> xs@10@01))
        (= (as letvar@16@01  list) (tail_Cons<list> xs@10@01))
        (=>
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (=
              (as letvar@17@01  Int)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
        (or
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))))
(assert (or
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@14@01  list) (tail_Cons<list> xs@10@01))))
    (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01)))
    (=>
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (=>
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> xs@10@01)
            (= (as letvar@15@01  Int) (head_Cons<Int> xs@10@01))
            (= (as letvar@16@01  list) (tail_Cons<list> xs@10@01))
            (=>
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (and
                (is_Cons<Bool> (tail_Cons<list> xs@10@01))
                (=
                  (as letvar@17@01  Int)
                  (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
            (or
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
    (or
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 13 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))]
(assert (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))))]
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (not (is_Nil<Bool> xs@10@01))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (and
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (<
                (head_Cons<Int> xs@10@01)
                (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(push) ; 3
(assert (not (=>
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))
  false)))
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
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))) ==> false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))))
; [eval] !is_Nil(xs)
; [eval] is_Nil(xs)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | is_Nil[Bool](xs@10@01) | live]
; [else-branch: 14 | !(is_Nil[Bool](xs@10@01)) | live]
(push) ; 4
; [then-branch: 14 | is_Nil[Bool](xs@10@01)]
(assert (is_Nil<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 14 | !(is_Nil[Bool](xs@10@01))]
(assert (not (is_Nil<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys)))
; [eval] is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 15 | is_Cons[Bool](xs@10@01) | live]
(push) ; 6
; [then-branch: 15 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@18@01 list)
(assert (= (as letvar@18@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Nil(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@18@01  list) (tail_Cons<list> xs@10@01)))))
(assert (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)) | live]
; [else-branch: 16 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) | live]
(push) ; 6
; [then-branch: 16 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))]
(assert (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))
; [eval] is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 17 | is_Cons[Bool](xs@10@01) | live]
(push) ; 8
; [then-branch: 17 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 17 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] head_Cons(xs)
(declare-const letvar@19@01 Int)
(assert (= (as letvar@19@01  Int) (head_Cons<Int> xs@10@01)))
; [eval] (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))
; [eval] tail_Cons(xs)
(declare-const letvar@20@01 list)
(assert (= (as letvar@20@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)
; [eval] is_Cons(ys)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 18 | !(is_Cons[Bool](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 18 | is_Cons[Bool](tail_Cons[list](xs@10@01)) | live]
(push) ; 10
; [then-branch: 18 | !(is_Cons[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 18 | is_Cons[Bool](tail_Cons[list](xs@10@01))]
(assert (is_Cons<Bool> (tail_Cons<list> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let z == (head_Cons(ys)) in y < z)
; [eval] head_Cons(ys)
(declare-const letvar@21@01 Int)
(assert (= (as letvar@21@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))
; [eval] y < z
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (and
    (is_Cons<Bool> (tail_Cons<list> xs@10@01))
    (= (as letvar@21@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))))
(assert (or
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@19@01  Int) (head_Cons<Int> xs@10@01))
    (= (as letvar@20@01  list) (tail_Cons<list> xs@10@01))
    (=>
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (and
        (is_Cons<Bool> (tail_Cons<list> xs@10@01))
        (= (as letvar@21@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
    (or
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@19@01  Int) (head_Cons<Int> xs@10@01))
        (= (as letvar@20@01  list) (tail_Cons<list> xs@10@01))
        (=>
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (=
              (as letvar@21@01  Int)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
        (or
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))))
(assert (or
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@18@01  list) (tail_Cons<list> xs@10@01))))
    (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01)))
    (=>
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (=>
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> xs@10@01)
            (= (as letvar@19@01  Int) (head_Cons<Int> xs@10@01))
            (= (as letvar@20@01  list) (tail_Cons<list> xs@10@01))
            (=>
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (and
                (is_Cons<Bool> (tail_Cons<list> xs@10@01))
                (=
                  (as letvar@21@01  Int)
                  (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
            (or
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
    (or
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 19 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))]
(assert (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))))]
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))
  false)))
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
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))) ==> false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))))
; [eval] !is_Nil(xs)
; [eval] is_Nil(xs)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 20 | is_Nil[Bool](xs@10@01) | live]
; [else-branch: 20 | !(is_Nil[Bool](xs@10@01)) | live]
(push) ; 4
; [then-branch: 20 | is_Nil[Bool](xs@10@01)]
(assert (is_Nil<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 20 | !(is_Nil[Bool](xs@10@01))]
(assert (not (is_Nil<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys)))
; [eval] is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 21 | is_Cons[Bool](xs@10@01) | live]
(push) ; 6
; [then-branch: 21 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 21 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@22@01 list)
(assert (= (as letvar@22@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Nil(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@22@01  list) (tail_Cons<list> xs@10@01)))))
(assert (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)) | live]
; [else-branch: 22 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) | live]
(push) ; 6
; [then-branch: 22 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))]
(assert (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 22 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))
; [eval] is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 23 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 23 | is_Cons[Bool](xs@10@01) | live]
(push) ; 8
; [then-branch: 23 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 23 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] head_Cons(xs)
(declare-const letvar@23@01 Int)
(assert (= (as letvar@23@01  Int) (head_Cons<Int> xs@10@01)))
; [eval] (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))
; [eval] tail_Cons(xs)
(declare-const letvar@24@01 list)
(assert (= (as letvar@24@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)
; [eval] is_Cons(ys)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | !(is_Cons[Bool](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 24 | is_Cons[Bool](tail_Cons[list](xs@10@01)) | live]
(push) ; 10
; [then-branch: 24 | !(is_Cons[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 24 | is_Cons[Bool](tail_Cons[list](xs@10@01))]
(assert (is_Cons<Bool> (tail_Cons<list> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let z == (head_Cons(ys)) in y < z)
; [eval] head_Cons(ys)
(declare-const letvar@25@01 Int)
(assert (= (as letvar@25@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))
; [eval] y < z
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (and
    (is_Cons<Bool> (tail_Cons<list> xs@10@01))
    (= (as letvar@25@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))))
(assert (or
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@23@01  Int) (head_Cons<Int> xs@10@01))
    (= (as letvar@24@01  list) (tail_Cons<list> xs@10@01))
    (=>
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (and
        (is_Cons<Bool> (tail_Cons<list> xs@10@01))
        (= (as letvar@25@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
    (or
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@23@01  Int) (head_Cons<Int> xs@10@01))
        (= (as letvar@24@01  list) (tail_Cons<list> xs@10@01))
        (=>
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (=
              (as letvar@25@01  Int)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
        (or
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))))
(assert (or
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@22@01  list) (tail_Cons<list> xs@10@01))))
    (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01)))
    (=>
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (=>
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> xs@10@01)
            (= (as letvar@23@01  Int) (head_Cons<Int> xs@10@01))
            (= (as letvar@24@01  list) (tail_Cons<list> xs@10@01))
            (=>
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (and
                (is_Cons<Bool> (tail_Cons<list> xs@10@01))
                (=
                  (as letvar@25@01  Int)
                  (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
            (or
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
    (or
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 25 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))]
(assert (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 25 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))))]
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))
  false)))
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
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))) ==> false
; [eval] !is_Nil(xs) && (!(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))) && !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))))
; [eval] !is_Nil(xs)
; [eval] is_Nil(xs)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 26 | is_Nil[Bool](xs@10@01) | live]
; [else-branch: 26 | !(is_Nil[Bool](xs@10@01)) | live]
(push) ; 4
; [then-branch: 26 | is_Nil[Bool](xs@10@01)]
(assert (is_Nil<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 26 | !(is_Nil[Bool](xs@10@01))]
(assert (not (is_Nil<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys)))
; [eval] is_Cons(xs) && (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 27 | is_Cons[Bool](xs@10@01) | live]
(push) ; 6
; [then-branch: 27 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 27 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let ys == (tail_Cons(xs)) in is_Nil(ys))
; [eval] tail_Cons(xs)
(declare-const letvar@26@01 list)
(assert (= (as letvar@26@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Nil(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@26@01  list) (tail_Cons<list> xs@10@01)))))
(assert (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)) | live]
; [else-branch: 28 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) | live]
(push) ; 6
; [then-branch: 28 | is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))]
(assert (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 28 | !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))))
; [eval] is_Cons(xs) && (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] is_Cons(xs)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | !(is_Cons[Bool](xs@10@01)) | live]
; [else-branch: 29 | is_Cons[Bool](xs@10@01) | live]
(push) ; 8
; [then-branch: 29 | !(is_Cons[Bool](xs@10@01))]
(assert (not (is_Cons<Bool> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 29 | is_Cons[Bool](xs@10@01)]
(assert (is_Cons<Bool> xs@10@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let y == (head_Cons(xs)) in (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)))
; [eval] head_Cons(xs)
(declare-const letvar@27@01 Int)
(assert (= (as letvar@27@01  Int) (head_Cons<Int> xs@10@01)))
; [eval] (let ys == (tail_Cons(xs)) in is_Cons(ys) && (let z == (head_Cons(ys)) in y < z))
; [eval] tail_Cons(xs)
(declare-const letvar@28@01 list)
(assert (= (as letvar@28@01  list) (tail_Cons<list> xs@10@01)))
; [eval] is_Cons(ys) && (let z == (head_Cons(ys)) in y < z)
; [eval] is_Cons(ys)
(set-option :timeout 0)
(push) ; 9
; [then-branch: 30 | !(is_Cons[Bool](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 30 | is_Cons[Bool](tail_Cons[list](xs@10@01)) | live]
(push) ; 10
; [then-branch: 30 | !(is_Cons[Bool](tail_Cons[list](xs@10@01)))]
(assert (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 30 | is_Cons[Bool](tail_Cons[list](xs@10@01))]
(assert (is_Cons<Bool> (tail_Cons<list> xs@10@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let z == (head_Cons(ys)) in y < z)
; [eval] head_Cons(ys)
(declare-const letvar@29@01 Int)
(assert (= (as letvar@29@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))
; [eval] y < z
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (and
    (is_Cons<Bool> (tail_Cons<list> xs@10@01))
    (= (as letvar@29@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01))))))
(assert (or
  (is_Cons<Bool> (tail_Cons<list> xs@10@01))
  (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (is_Cons<Bool> xs@10@01)
  (and
    (is_Cons<Bool> xs@10@01)
    (= (as letvar@27@01  Int) (head_Cons<Int> xs@10@01))
    (= (as letvar@28@01  list) (tail_Cons<list> xs@10@01))
    (=>
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (and
        (is_Cons<Bool> (tail_Cons<list> xs@10@01))
        (= (as letvar@29@01  Int) (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
    (or
      (is_Cons<Bool> (tail_Cons<list> xs@10@01))
      (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@27@01  Int) (head_Cons<Int> xs@10@01))
        (= (as letvar@28@01  list) (tail_Cons<list> xs@10@01))
        (=>
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (=
              (as letvar@29@01  Int)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
        (or
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (not (is_Cons<Bool> (tail_Cons<list> xs@10@01)))))))))
(assert (or
  (not (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
  (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not (is_Nil<Bool> xs@10@01))
    (=>
      (is_Cons<Bool> xs@10@01)
      (and
        (is_Cons<Bool> xs@10@01)
        (= (as letvar@26@01  list) (tail_Cons<list> xs@10@01))))
    (or (is_Cons<Bool> xs@10@01) (not (is_Cons<Bool> xs@10@01)))
    (=>
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and
        (not
          (and
            (is_Cons<Bool> xs@10@01)
            (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
        (=>
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> xs@10@01)
            (= (as letvar@27@01  Int) (head_Cons<Int> xs@10@01))
            (= (as letvar@28@01  list) (tail_Cons<list> xs@10@01))
            (=>
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (and
                (is_Cons<Bool> (tail_Cons<list> xs@10@01))
                (=
                  (as letvar@29@01  Int)
                  (head_Cons<Int> (tail_Cons<list> xs@10@01)))))
            (or
              (is_Cons<Bool> (tail_Cons<list> xs@10@01))
              (not (is_Cons<Bool> (tail_Cons<list> xs@10@01))))))))
    (or
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01)))))))
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))) | live]
; [else-branch: 31 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 31 | !(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01)))]
(assert (and
  (not (is_Nil<Bool> xs@10@01))
  (and
    (not
      (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
    (not
      (and
        (is_Cons<Bool> xs@10@01)
        (and
          (is_Cons<Bool> (tail_Cons<list> xs@10@01))
          (<
            (head_Cons<Int> xs@10@01)
            (head_Cons<Int> (tail_Cons<list> xs@10@01)))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 31 | !(!(is_Nil[Bool](xs@10@01)) && !(is_Cons[Bool](xs@10@01) && is_Nil[Bool](tail_Cons[list](xs@10@01))) && !(is_Cons[Bool](xs@10@01) && is_Cons[Bool](tail_Cons[list](xs@10@01)) && head_Cons[Int](xs@10@01) < head_Cons[Int](tail_Cons[list](xs@10@01))))]
(assert (not
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=>
  (and
    (not (is_Nil<Bool> xs@10@01))
    (and
      (not
        (and (is_Cons<Bool> xs@10@01) (is_Nil<Bool> (tail_Cons<list> xs@10@01))))
      (not
        (and
          (is_Cons<Bool> xs@10@01)
          (and
            (is_Cons<Bool> (tail_Cons<list> xs@10@01))
            (<
              (head_Cons<Int> xs@10@01)
              (head_Cons<Int> (tail_Cons<list> xs@10@01))))))))
  false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
