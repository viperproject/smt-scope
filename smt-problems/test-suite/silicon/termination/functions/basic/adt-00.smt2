(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:27
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/adt.vpr
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
(declare-sort WellFoundedOrder<Int> 0)
(declare-sort IntWellFoundedOrder 0)
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
(declare-fun $SortWrappers.WellFoundedOrder<Int>To$Snap (WellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Int> ($Snap) WellFoundedOrder<Int>)
(assert (forall ((x WellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Int>($SortWrappers.WellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Int> x))
    :qid |$Snap.WellFoundedOrder<Int>To$SnapToWellFoundedOrder<Int>|
    )))
(declare-fun $SortWrappers.IntWellFoundedOrderTo$Snap (IntWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntWellFoundedOrder ($Snap) IntWellFoundedOrder)
(assert (forall ((x IntWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntWellFoundedOrder($SortWrappers.IntWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntWellFoundedOrder x))
    :qid |$Snap.IntWellFoundedOrderTo$SnapToIntWellFoundedOrder|
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
(declare-fun size<Int> (list) Int)
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun f ($Snap list) Int)
(declare-fun f%limited ($Snap list) Int)
(declare-fun f%stateless (list) Bool)
(declare-fun f%precondition ($Snap list) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
(assert (distinct type_Nil<Int> type_Cons<Int>))
; ////////// Axioms
(assert (forall ((int1 Int) (int2 Int)) (!
  (=> (< int1 int2) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.integer_ax_dec|)))
(assert (forall ((int1 Int)) (!
  (=> (>= int1 0) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.integer_ax_bound|)))
(assert (forall ((xs list)) (!
  (= (is_Nil<Bool> xs) (not (is_Cons<Bool> xs)))
  :pattern ((is_Nil<Bool> xs))
  :pattern ((is_Cons<Bool> xs))
  :qid |prog.eitherConsorNil|)))
(assert (forall ((xs list)) (!
  (and
    (= (is_Nil<Bool> xs) (= (size<Int> xs) 0))
    (and
      (= (is_Cons<Bool> xs) (> (size<Int> xs) 0))
      (and
        (=
          (is_Cons<Bool> xs)
          (> (size<Int> xs) (size<Int> (tail_Cons<list> xs))))
        (=
          (is_Cons<Bool> xs)
          (= (size<Int> xs) (+ 1 (size<Int> (tail_Cons<list> xs))))))))
  :pattern ((is_Nil<Bool> xs))
  :pattern ((size<Int> xs))
  :pattern ((is_Cons<Bool> xs))
  :pattern ((size<Int> (tail_Cons<list> xs)))
  :qid |prog.numberOfElem|)))
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
(assert (forall ((s@$ $Snap) (xs@0@00 list)) (!
  (= (f%limited s@$ xs@0@00) (f s@$ xs@0@00))
  :pattern ((f s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 list)) (!
  (f%stateless xs@0@00)
  :pattern ((f%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 list)) (!
  (=>
    (f%precondition s@$ xs@0@00)
    (=
      (f s@$ xs@0@00)
      (ite
        (> (size<Int> xs@0@00) 0)
        (f%limited $Snap.unit (tail_Cons<list> xs@0@00))
        6)))
  :pattern ((f s@$ xs@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@0@00 list)) (!
  (=>
    (f%precondition s@$ xs@0@00)
    (ite
      (> (size<Int> xs@0@00) 0)
      (f%precondition $Snap.unit (tail_Cons<list> xs@0@00))
      true))
  :pattern ((f s@$ xs@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- f_termination_proof ----------
(declare-const xs@0@01 list)
(declare-const xs@1@01 list)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] size(xs) >= 0
; [eval] size(xs)
(assert (>= (size<Int> xs@1@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] size(xs) > 0
; [eval] size(xs)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (size<Int> xs@1@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> (size<Int> xs@1@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [then-branch: 0 | size[Int](xs@1@01) > 0 | live]
; [else-branch: 0 | !(size[Int](xs@1@01) > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | size[Int](xs@1@01) > 0]
(assert (> (size<Int> xs@1@01) 0))
; [exec]
; assert (decreasing(size(tail_Cons(xs)), old(size(xs))): Bool) &&
;   (bounded(old(size(xs))): Bool)
; [eval] (decreasing(size(tail_Cons(xs)), old(size(xs))): Bool)
; [eval] size(tail_Cons(xs))
; [eval] tail_Cons(xs)
; [eval] old(size(xs))
; [eval] size(xs)
(push) ; 4
(assert (not (decreasing<Bool> (size<Int> (tail_Cons<list> xs@1@01)) (size<Int> xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (size<Int> (tail_Cons<list> xs@1@01)) (size<Int> xs@1@01)))
; [eval] (bounded(old(size(xs))): Bool)
; [eval] old(size(xs))
; [eval] size(xs)
(push) ; 4
(assert (not (bounded<Bool> (size<Int> xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> (size<Int> xs@1@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(size[Int](xs@1@01) > 0)]
(assert (not (> (size<Int> xs@1@01) 0)))
(pop) ; 3
; [eval] !(size(xs) > 0)
; [eval] size(xs) > 0
; [eval] size(xs)
(push) ; 3
(set-option :timeout 10)
(assert (not (> (size<Int> xs@1@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (size<Int> xs@1@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(size[Int](xs@1@01) > 0) | live]
; [else-branch: 1 | size[Int](xs@1@01) > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(size[Int](xs@1@01) > 0)]
(assert (not (> (size<Int> xs@1@01) 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | size[Int](xs@1@01) > 0]
(assert (> (size<Int> xs@1@01) 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
