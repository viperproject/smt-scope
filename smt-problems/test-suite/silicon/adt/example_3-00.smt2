(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/adt/example_3.vpr
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
(declare-sort List_ 0)
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
(declare-fun $SortWrappers.List_To$Snap (List_) $Snap)
(declare-fun $SortWrappers.$SnapToList_ ($Snap) List_)
(assert (forall ((x List_)) (!
    (= x ($SortWrappers.$SnapToList_($SortWrappers.List_To$Snap x)))
    :pattern (($SortWrappers.List_To$Snap x))
    :qid |$Snap.$SnapToList_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List_To$Snap($SortWrappers.$SnapToList_ x)))
    :pattern (($SortWrappers.$SnapToList_ x))
    :qid |$Snap.List_To$SnapToList_|
    )))
; ////////// Symbols
(declare-const Nil<List> List_)
(declare-fun Cons<List> (Int List_) List_)
(declare-fun get_List_head<Int> (List_) Int)
(declare-fun get_List_tail<List> (List_) List_)
(declare-fun List_tag<Int> (List_) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun len ($Snap List_) Int)
(declare-fun len%limited ($Snap List_) Int)
(declare-fun len%stateless (List_) Bool)
(declare-fun len%precondition ($Snap List_) Bool)
(declare-fun at ($Snap List_ Int) Int)
(declare-fun at%limited ($Snap List_ Int) Int)
(declare-fun at%stateless (List_ Int) Bool)
(declare-fun at%precondition ($Snap List_ Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((head Int) (tail List_)) (!
  (= head (get_List_head<Int> (Cons<List> head tail)))
  :pattern ((Cons<List> head tail))
  )))
(assert (forall ((head Int) (tail List_)) (!
  (= tail (get_List_tail<List> (Cons<List> head tail)))
  :pattern ((Cons<List> head tail))
  )))
(assert (= (List_tag<Int> (as Nil<List>  List_)) 1))
(assert (forall ((head Int) (tail List_)) (!
  (= (List_tag<Int> (Cons<List> head tail)) 0)
  :pattern ((Cons<List> head tail))
  )))
(assert (forall ((t List_)) (!
  (or
    (= t (as Nil<List>  List_))
    (= t (Cons<List> (get_List_head<Int> t) (get_List_tail<List> t))))
  :pattern ((List_tag<Int> t))
  :pattern ((get_List_head<Int> t))
  :pattern ((get_List_tail<List> t))
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
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (= (len%limited s@$ xs@0@00) (len s@$ xs@0@00))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (len%stateless xs@0@00)
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (let ((result@1@00 (len%limited s@$ xs@0@00))) (=>
    (len%precondition s@$ xs@0@00)
    (>= result@1@00 0)))
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (let ((result@1@00 (len%limited s@$ xs@0@00))) true)
  :pattern ((len%limited s@$ xs@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (=>
    (len%precondition s@$ xs@0@00)
    (=
      (len s@$ xs@0@00)
      (ite
        (= (List_tag<Int> xs@0@00) 1)
        0
        (+ 1 (len%limited $Snap.unit (get_List_tail<List> xs@0@00))))))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 List_)) (!
  (=>
    (len%precondition s@$ xs@0@00)
    (ite
      (= (List_tag<Int> xs@0@00) 1)
      true
      (len%precondition $Snap.unit (get_List_tail<List> xs@0@00))))
  :pattern ((len s@$ xs@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (= (at%limited s@$ xs@2@00 pos@3@00) (at s@$ xs@2@00 pos@3@00))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (at%stateless xs@2@00 pos@3@00)
  :pattern ((at%limited s@$ xs@2@00 pos@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (=>
    (at%precondition s@$ xs@2@00 pos@3@00)
    (=
      (at s@$ xs@2@00 pos@3@00)
      (ite
        (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))
        (- 0 1)
        (ite
          (= pos@3@00 0)
          (get_List_head<Int> xs@2@00)
          (at%limited $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1))))))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@2@00 List_) (pos@3@00 Int)) (!
  (=>
    (at%precondition s@$ xs@2@00 pos@3@00)
    (ite
      (or (= (List_tag<Int> xs@2@00) 1) (< pos@3@00 0))
      true
      (ite
        (= pos@3@00 0)
        true
        (at%precondition $Snap.unit (get_List_tail<List> xs@2@00) (- pos@3@00 1)))))
  :pattern ((at s@$ xs@2@00 pos@3@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- prepend ----------
(declare-const xs@0@01 List_)
(declare-const v@1@01 Int)
(declare-const ys@2@01 List_)
(declare-const xs@3@01 List_)
(declare-const v@4@01 Int)
(declare-const ys@5@01 List_)
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
; [eval] get_List_head(ys) == v
; [eval] get_List_head(ys)
(assert (= (get_List_head<Int> ys@5@01) v@4@01))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] get_List_tail(ys) == xs
; [eval] get_List_tail(ys)
(assert (= (get_List_tail<List> ys@5@01) xs@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; ys := Cons(v, xs)
; [eval] Cons(v, xs)
(declare-const ys@7@01 List_)
(assert (= ys@7@01 (Cons<List> v@4@01 xs@3@01)))
; [eval] get_List_head(ys) == v
; [eval] get_List_head(ys)
(push) ; 3
(assert (not (= (get_List_head<Int> ys@7@01) v@4@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get_List_head<Int> ys@7@01) v@4@01))
; [eval] get_List_tail(ys) == xs
; [eval] get_List_tail(ys)
(push) ; 3
(assert (not (= (get_List_tail<List> ys@7@01) xs@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get_List_tail<List> ys@7@01) xs@3@01))
(pop) ; 2
(pop) ; 1
; ---------- linear_search ----------
(declare-const xs@8@01 List_)
(declare-const key@9@01 Int)
(declare-const pos@10@01 Int)
(declare-const xs@11@01 List_)
(declare-const key@12@01 Int)
(declare-const pos@13@01 Int)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] key >= 0
(assert (>= key@12@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] 0 <= pos
(assert (<= 0 pos@13@01))
(assert (=
  ($Snap.second $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@01))
    ($Snap.second ($Snap.second $t@15@01)))))
(assert (= ($Snap.first ($Snap.second $t@15@01)) $Snap.unit))
; [eval] pos <= len(xs)
; [eval] len(xs)
(push) ; 3
(assert (len%precondition $Snap.unit xs@11@01))
(pop) ; 3
; Joined path conditions
(assert (len%precondition $Snap.unit xs@11@01))
(assert (<= pos@13@01 (len $Snap.unit xs@11@01)))
(assert (=
  ($Snap.second ($Snap.second $t@15@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@15@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@15@01))) $Snap.unit))
; [eval] at(xs, pos) == key || pos == len(xs)
; [eval] at(xs, pos) == key
; [eval] at(xs, pos)
(push) ; 3
(assert (at%precondition $Snap.unit xs@11@01 pos@13@01))
(pop) ; 3
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 pos@13@01))
(push) ; 3
; [then-branch: 0 | at(_, xs@11@01, pos@13@01) == key@12@01 | live]
; [else-branch: 0 | at(_, xs@11@01, pos@13@01) != key@12@01 | live]
(push) ; 4
; [then-branch: 0 | at(_, xs@11@01, pos@13@01) == key@12@01]
(assert (= (at $Snap.unit xs@11@01 pos@13@01) key@12@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | at(_, xs@11@01, pos@13@01) != key@12@01]
(assert (not (= (at $Snap.unit xs@11@01 pos@13@01) key@12@01)))
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 5
(pop) ; 5
; Joined path conditions
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (at $Snap.unit xs@11@01 pos@13@01) key@12@01))
  (= (at $Snap.unit xs@11@01 pos@13@01) key@12@01)))
(assert (or
  (= (at $Snap.unit xs@11@01 pos@13@01) key@12@01)
  (= pos@13@01 (len $Snap.unit xs@11@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@15@01))) $Snap.unit))
; [eval] pos == len(xs) ==> (forall k: Int :: { at(xs, k) } 0 <= k && k < len(xs) ==> at(xs, k) != key)
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= pos@13@01 (len $Snap.unit xs@11@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= pos@13@01 (len $Snap.unit xs@11@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | pos@13@01 == len(_, xs@11@01) | live]
; [else-branch: 1 | pos@13@01 != len(_, xs@11@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | pos@13@01 == len(_, xs@11@01)]
(assert (= pos@13@01 (len $Snap.unit xs@11@01)))
; [eval] (forall k: Int :: { at(xs, k) } 0 <= k && k < len(xs) ==> at(xs, k) != key)
(declare-const k@16@01 Int)
(push) ; 5
; [eval] 0 <= k && k < len(xs) ==> at(xs, k) != key
; [eval] 0 <= k && k < len(xs)
; [eval] 0 <= k
(push) ; 6
; [then-branch: 2 | !(0 <= k@16@01) | live]
; [else-branch: 2 | 0 <= k@16@01 | live]
(push) ; 7
; [then-branch: 2 | !(0 <= k@16@01)]
(assert (not (<= 0 k@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | 0 <= k@16@01]
(assert (<= 0 k@16@01))
; [eval] k < len(xs)
; [eval] len(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@16@01) (not (<= 0 k@16@01))))
(push) ; 6
; [then-branch: 3 | 0 <= k@16@01 && k@16@01 < len(_, xs@11@01) | live]
; [else-branch: 3 | !(0 <= k@16@01 && k@16@01 < len(_, xs@11@01)) | live]
(push) ; 7
; [then-branch: 3 | 0 <= k@16@01 && k@16@01 < len(_, xs@11@01)]
(assert (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01))))
; [eval] at(xs, k) != key
; [eval] at(xs, k)
(push) ; 8
(assert (at%precondition $Snap.unit xs@11@01 k@16@01))
(pop) ; 8
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@16@01))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | !(0 <= k@16@01 && k@16@01 < len(_, xs@11@01))]
(assert (not (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))
  (and
    (<= 0 k@16@01)
    (< k@16@01 (len $Snap.unit xs@11@01))
    (at%precondition $Snap.unit xs@11@01 k@16@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01))))
  (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@16@01 Int)) (!
  (and
    (or (<= 0 k@16@01) (not (<= 0 k@16@01)))
    (=>
      (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))
      (and
        (<= 0 k@16@01)
        (< k@16@01 (len $Snap.unit xs@11@01))
        (at%precondition $Snap.unit xs@11@01 k@16@01)))
    (or
      (not (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01))))
      (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@16@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90-aux|)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | pos@13@01 != len(_, xs@11@01)]
(assert (not (= pos@13@01 (len $Snap.unit xs@11@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= pos@13@01 (len $Snap.unit xs@11@01))
  (and
    (= pos@13@01 (len $Snap.unit xs@11@01))
    (forall ((k@16@01 Int)) (!
      (and
        (or (<= 0 k@16@01) (not (<= 0 k@16@01)))
        (=>
          (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))
          (and
            (<= 0 k@16@01)
            (< k@16@01 (len $Snap.unit xs@11@01))
            (at%precondition $Snap.unit xs@11@01 k@16@01)))
        (or
          (not (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01))))
          (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))))
      :pattern ((at%limited $Snap.unit xs@11@01 k@16@01))
      :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90-aux|)))))
; Joined path conditions
(assert (or
  (not (= pos@13@01 (len $Snap.unit xs@11@01)))
  (= pos@13@01 (len $Snap.unit xs@11@01))))
(assert (=>
  (= pos@13@01 (len $Snap.unit xs@11@01))
  (forall ((k@16@01 Int)) (!
    (=>
      (and (<= 0 k@16@01) (< k@16@01 (len $Snap.unit xs@11@01)))
      (not (= (at $Snap.unit xs@11@01 k@16@01) key@12@01)))
    :pattern ((at%limited $Snap.unit xs@11@01 k@16@01))
    :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90|))))
(pop) ; 2
(push) ; 2
; [exec]
; var ys: List
(declare-const ys@17@01 List_)
; [exec]
; pos := 0
; [exec]
; ys := xs
(declare-const old_ys@18@01 List_)
(declare-const ys@19@01 List_)
(declare-const pos@20@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
; [eval] 0 <= pos
(assert (<= 0 pos@20@01))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
; [eval] pos + len(ys) == len(xs)
; [eval] pos + len(ys)
; [eval] len(ys)
(push) ; 4
(assert (len%precondition $Snap.unit ys@19@01))
(pop) ; 4
; Joined path conditions
(assert (len%precondition $Snap.unit ys@19@01))
; [eval] len(xs)
(push) ; 4
(assert (len%precondition $Snap.unit xs@11@01))
(pop) ; 4
; Joined path conditions
(assert (len%precondition $Snap.unit xs@11@01))
(assert (= (+ pos@20@01 (len $Snap.unit ys@19@01)) (len $Snap.unit xs@11@01)))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
; [eval] List_tag(ys) == 1 ==> pos == len(xs)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> ys@19@01) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (List_tag<Int> ys@19@01) 1)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | List_tag[Int](ys@19@01) == 1 | live]
; [else-branch: 4 | List_tag[Int](ys@19@01) != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 4 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= (List_tag<Int> ys@19@01) 1)) (= (List_tag<Int> ys@19@01) 1)))
(assert (=> (= (List_tag<Int> ys@19@01) 1) (= pos@20@01 (len $Snap.unit xs@11@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { at(ys, k) } 0 <= k ==> at(xs, pos + k) == at(ys, k))
(declare-const k@22@01 Int)
(push) ; 4
; [eval] 0 <= k ==> at(xs, pos + k) == at(ys, k)
; [eval] 0 <= k
(push) ; 5
; [then-branch: 5 | 0 <= k@22@01 | live]
; [else-branch: 5 | !(0 <= k@22@01) | live]
(push) ; 6
; [then-branch: 5 | 0 <= k@22@01]
(assert (<= 0 k@22@01))
; [eval] at(xs, pos + k) == at(ys, k)
; [eval] at(xs, pos + k)
; [eval] pos + k
(push) ; 7
(assert (at%precondition $Snap.unit xs@11@01 (+ pos@20@01 k@22@01)))
(pop) ; 7
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 (+ pos@20@01 k@22@01)))
; [eval] at(ys, k)
(push) ; 7
(assert (at%precondition $Snap.unit ys@19@01 k@22@01))
(pop) ; 7
; Joined path conditions
(assert (at%precondition $Snap.unit ys@19@01 k@22@01))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | !(0 <= k@22@01)]
(assert (not (<= 0 k@22@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (<= 0 k@22@01)
  (and
    (<= 0 k@22@01)
    (at%precondition $Snap.unit xs@11@01 (+ pos@20@01 k@22@01))
    (at%precondition $Snap.unit ys@19@01 k@22@01))))
; Joined path conditions
(assert (or (not (<= 0 k@22@01)) (<= 0 k@22@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@22@01 Int)) (!
  (and
    (=>
      (<= 0 k@22@01)
      (and
        (<= 0 k@22@01)
        (at%precondition $Snap.unit xs@11@01 (+ pos@20@01 k@22@01))
        (at%precondition $Snap.unit ys@19@01 k@22@01)))
    (or (not (<= 0 k@22@01)) (<= 0 k@22@01)))
  :pattern ((at%limited $Snap.unit ys@19@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72-aux|)))
(assert (forall ((k@22@01 Int)) (!
  (=>
    (<= 0 k@22@01)
    (=
      (at $Snap.unit xs@11@01 (+ pos@20@01 k@22@01))
      (at $Snap.unit ys@19@01 k@22@01)))
  :pattern ((at%limited $Snap.unit ys@19@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { at(xs, k) } 0 <= k && k < pos ==> at(xs, k) != key)
(declare-const k@23@01 Int)
(push) ; 4
; [eval] 0 <= k && k < pos ==> at(xs, k) != key
; [eval] 0 <= k && k < pos
; [eval] 0 <= k
(push) ; 5
; [then-branch: 6 | !(0 <= k@23@01) | live]
; [else-branch: 6 | 0 <= k@23@01 | live]
(push) ; 6
; [then-branch: 6 | !(0 <= k@23@01)]
(assert (not (<= 0 k@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | 0 <= k@23@01]
(assert (<= 0 k@23@01))
; [eval] k < pos
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@23@01) (not (<= 0 k@23@01))))
(push) ; 5
; [then-branch: 7 | 0 <= k@23@01 && k@23@01 < pos@20@01 | live]
; [else-branch: 7 | !(0 <= k@23@01 && k@23@01 < pos@20@01) | live]
(push) ; 6
; [then-branch: 7 | 0 <= k@23@01 && k@23@01 < pos@20@01]
(assert (and (<= 0 k@23@01) (< k@23@01 pos@20@01)))
; [eval] at(xs, k) != key
; [eval] at(xs, k)
(push) ; 7
(assert (at%precondition $Snap.unit xs@11@01 k@23@01))
(pop) ; 7
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@23@01))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(0 <= k@23@01 && k@23@01 < pos@20@01)]
(assert (not (and (<= 0 k@23@01) (< k@23@01 pos@20@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (<= 0 k@23@01) (< k@23@01 pos@20@01))
  (and
    (<= 0 k@23@01)
    (< k@23@01 pos@20@01)
    (at%precondition $Snap.unit xs@11@01 k@23@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@23@01) (< k@23@01 pos@20@01)))
  (and (<= 0 k@23@01) (< k@23@01 pos@20@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@23@01 Int)) (!
  (and
    (or (<= 0 k@23@01) (not (<= 0 k@23@01)))
    (=>
      (and (<= 0 k@23@01) (< k@23@01 pos@20@01))
      (and
        (<= 0 k@23@01)
        (< k@23@01 pos@20@01)
        (at%precondition $Snap.unit xs@11@01 k@23@01)))
    (or
      (not (and (<= 0 k@23@01) (< k@23@01 pos@20@01)))
      (and (<= 0 k@23@01) (< k@23@01 pos@20@01))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73-aux|)))
(assert (forall ((k@23@01 Int)) (!
  (=>
    (and (<= 0 k@23@01) (< k@23@01 pos@20@01))
    (not (= (at $Snap.unit xs@11@01 k@23@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= pos
; [eval] pos + len(ys) == len(xs)
; [eval] pos + len(ys)
; [eval] len(ys)
(push) ; 4
(assert (len%precondition $Snap.unit xs@11@01))
(pop) ; 4
; Joined path conditions
(assert (len%precondition $Snap.unit xs@11@01))
; [eval] len(xs)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] List_tag(ys) == 1 ==> pos == len(xs)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> xs@11@01) 1))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (List_tag<Int> xs@11@01) 1)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | List_tag[Int](xs@11@01) == 1 | live]
; [else-branch: 8 | List_tag[Int](xs@11@01) != 1 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | List_tag[Int](xs@11@01) == 1]
(assert (= (List_tag<Int> xs@11@01) 1))
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 8 | List_tag[Int](xs@11@01) != 1]
(assert (not (= (List_tag<Int> xs@11@01) 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= (List_tag<Int> xs@11@01) 1)) (= (List_tag<Int> xs@11@01) 1)))
(push) ; 4
(assert (not (=> (= (List_tag<Int> xs@11@01) 1) (= 0 (len $Snap.unit xs@11@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (= (List_tag<Int> xs@11@01) 1) (= 0 (len $Snap.unit xs@11@01))))
; [eval] (forall k: Int :: { at(ys, k) } 0 <= k ==> at(xs, pos + k) == at(ys, k))
(declare-const k@24@01 Int)
(push) ; 4
; [eval] 0 <= k ==> at(xs, pos + k) == at(ys, k)
; [eval] 0 <= k
(push) ; 5
; [then-branch: 9 | 0 <= k@24@01 | live]
; [else-branch: 9 | !(0 <= k@24@01) | live]
(push) ; 6
; [then-branch: 9 | 0 <= k@24@01]
(assert (<= 0 k@24@01))
; [eval] at(xs, pos + k) == at(ys, k)
; [eval] at(xs, pos + k)
; [eval] pos + k
(push) ; 7
(assert (at%precondition $Snap.unit xs@11@01 k@24@01))
(pop) ; 7
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@24@01))
; [eval] at(ys, k)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(0 <= k@24@01)]
(assert (not (<= 0 k@24@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (<= 0 k@24@01)
  (and (<= 0 k@24@01) (at%precondition $Snap.unit xs@11@01 k@24@01))))
; Joined path conditions
(assert (or (not (<= 0 k@24@01)) (<= 0 k@24@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@24@01 Int)) (!
  (and
    (=>
      (<= 0 k@24@01)
      (and (<= 0 k@24@01) (at%precondition $Snap.unit xs@11@01 k@24@01)))
    (or (not (<= 0 k@24@01)) (<= 0 k@24@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@24@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72-aux|)))
; [eval] (forall k: Int :: { at(xs, k) } 0 <= k && k < pos ==> at(xs, k) != key)
(declare-const k@25@01 Int)
(push) ; 4
; [eval] 0 <= k && k < pos ==> at(xs, k) != key
; [eval] 0 <= k && k < pos
; [eval] 0 <= k
(push) ; 5
; [then-branch: 10 | !(0 <= k@25@01) | live]
; [else-branch: 10 | 0 <= k@25@01 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= k@25@01)]
(assert (not (<= 0 k@25@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= k@25@01]
(assert (<= 0 k@25@01))
; [eval] k < pos
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@25@01) (not (<= 0 k@25@01))))
(push) ; 5
; [then-branch: 11 | 0 <= k@25@01 && k@25@01 < 0 | live]
; [else-branch: 11 | !(0 <= k@25@01 && k@25@01 < 0) | live]
(push) ; 6
; [then-branch: 11 | 0 <= k@25@01 && k@25@01 < 0]
(assert (and (<= 0 k@25@01) (< k@25@01 0)))
; [eval] at(xs, k) != key
; [eval] at(xs, k)
(push) ; 7
(assert (at%precondition $Snap.unit xs@11@01 k@25@01))
(pop) ; 7
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@25@01))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= k@25@01 && k@25@01 < 0)]
(assert (not (and (<= 0 k@25@01) (< k@25@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and (<= 0 k@25@01) (< k@25@01 0))
  (and
    (<= 0 k@25@01)
    (< k@25@01 0)
    (at%precondition $Snap.unit xs@11@01 k@25@01))))
; Joined path conditions
(assert (or (not (and (<= 0 k@25@01) (< k@25@01 0))) (and (<= 0 k@25@01) (< k@25@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@25@01 Int)) (!
  (and
    (or (<= 0 k@25@01) (not (<= 0 k@25@01)))
    (=>
      (and (<= 0 k@25@01) (< k@25@01 0))
      (and
        (<= 0 k@25@01)
        (< k@25@01 0)
        (at%precondition $Snap.unit xs@11@01 k@25@01)))
    (or
      (not (and (<= 0 k@25@01) (< k@25@01 0)))
      (and (<= 0 k@25@01) (< k@25@01 0))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73-aux|)))
(assert (forall ((k@25@01 Int)) (!
  (=>
    (and (<= 0 k@25@01) (< k@25@01 0))
    (at%precondition $Snap.unit xs@11@01 k@25@01))
  :pattern ((at%limited $Snap.unit xs@11@01 k@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73_precondition|)))
(push) ; 4
(assert (not (forall ((k@25@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 k@25@01) (< k@25@01 0))
        (at%precondition $Snap.unit xs@11@01 k@25@01))
      (and (<= 0 k@25@01) (< k@25@01 0)))
    (not (= (at $Snap.unit xs@11@01 k@25@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@25@01 Int)) (!
  (=>
    (and (<= 0 k@25@01) (< k@25@01 0))
    (not (= (at $Snap.unit xs@11@01 k@25@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@25@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (= ($Snap.first $t@21@01) $Snap.unit))
(assert (<= 0 pos@20@01))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
(assert (len%precondition $Snap.unit ys@19@01))
(assert (= (+ pos@20@01 (len $Snap.unit ys@19@01)) (len $Snap.unit xs@11@01)))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
(assert (or (not (= (List_tag<Int> ys@19@01) 1)) (= (List_tag<Int> ys@19@01) 1)))
(assert (=> (= (List_tag<Int> ys@19@01) 1) (= pos@20@01 (len $Snap.unit xs@11@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
(assert (forall ((k@22@01 Int)) (!
  (and
    (=>
      (<= 0 k@22@01)
      (and
        (<= 0 k@22@01)
        (at%precondition $Snap.unit xs@11@01 (+ pos@20@01 k@22@01))
        (at%precondition $Snap.unit ys@19@01 k@22@01)))
    (or (not (<= 0 k@22@01)) (<= 0 k@22@01)))
  :pattern ((at%limited $Snap.unit ys@19@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72-aux|)))
(assert (forall ((k@22@01 Int)) (!
  (=>
    (<= 0 k@22@01)
    (=
      (at $Snap.unit xs@11@01 (+ pos@20@01 k@22@01))
      (at $Snap.unit ys@19@01 k@22@01)))
  :pattern ((at%limited $Snap.unit ys@19@01 k@22@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
(assert (forall ((k@23@01 Int)) (!
  (and
    (or (<= 0 k@23@01) (not (<= 0 k@23@01)))
    (=>
      (and (<= 0 k@23@01) (< k@23@01 pos@20@01))
      (and
        (<= 0 k@23@01)
        (< k@23@01 pos@20@01)
        (at%precondition $Snap.unit xs@11@01 k@23@01)))
    (or
      (not (and (<= 0 k@23@01) (< k@23@01 pos@20@01)))
      (and (<= 0 k@23@01) (< k@23@01 pos@20@01))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73-aux|)))
(assert (forall ((k@23@01 Int)) (!
  (=>
    (and (<= 0 k@23@01) (< k@23@01 pos@20@01))
    (not (= (at $Snap.unit xs@11@01 k@23@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@23@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] !(List_tag(ys) == 1) && get_List_head(ys) != key
; [eval] !(List_tag(ys) == 1)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 6
; [then-branch: 12 | List_tag[Int](ys@19@01) == 1 | live]
; [else-branch: 12 | List_tag[Int](ys@19@01) != 1 | live]
(push) ; 7
; [then-branch: 12 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
; [eval] get_List_head(ys) != key
; [eval] get_List_head(ys)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(push) ; 5
; [eval] !(!(List_tag(ys) == 1) && get_List_head(ys) != key)
; [eval] !(List_tag(ys) == 1) && get_List_head(ys) != key
; [eval] !(List_tag(ys) == 1)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 6
; [then-branch: 13 | List_tag[Int](ys@19@01) == 1 | live]
; [else-branch: 13 | List_tag[Int](ys@19@01) != 1 | live]
(push) ; 7
; [then-branch: 13 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
; [eval] get_List_head(ys) != key
; [eval] get_List_head(ys)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] !(List_tag(ys) == 1) && get_List_head(ys) != key
; [eval] !(List_tag(ys) == 1)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 5
; [then-branch: 14 | List_tag[Int](ys@19@01) == 1 | live]
; [else-branch: 14 | List_tag[Int](ys@19@01) != 1 | live]
(push) ; 6
; [then-branch: 14 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
; [eval] get_List_head(ys) != key
; [eval] get_List_head(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= (List_tag<Int> ys@19@01) 1))
    (not (= (get_List_head<Int> ys@19@01) key@12@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (not (= (List_tag<Int> ys@19@01) 1))
  (not (= (get_List_head<Int> ys@19@01) key@12@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01 | live]
; [else-branch: 15 | !(List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01]
(assert (and
  (not (= (List_tag<Int> ys@19@01) 1))
  (not (= (get_List_head<Int> ys@19@01) key@12@01))))
; [exec]
; var old_ys: List
(declare-const old_ys@26@01 List_)
; [exec]
; old_ys := ys
; [exec]
; ys := get_List_tail(ys)
; [eval] get_List_tail(ys)
(declare-const ys@27@01 List_)
(assert (= ys@27@01 (get_List_tail<List> ys@19@01)))
; [exec]
; assert (forall k: Int ::
;     { at(ys, k) }
;     0 <= k ==> at(old_ys, k + 1) == at(ys, k))
; [eval] (forall k: Int :: { at(ys, k) } 0 <= k ==> at(old_ys, k + 1) == at(ys, k))
(declare-const k@28@01 Int)
(push) ; 6
; [eval] 0 <= k ==> at(old_ys, k + 1) == at(ys, k)
; [eval] 0 <= k
(push) ; 7
; [then-branch: 16 | 0 <= k@28@01 | live]
; [else-branch: 16 | !(0 <= k@28@01) | live]
(push) ; 8
; [then-branch: 16 | 0 <= k@28@01]
(assert (<= 0 k@28@01))
; [eval] at(old_ys, k + 1) == at(ys, k)
; [eval] at(old_ys, k + 1)
; [eval] k + 1
(push) ; 9
(assert (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1)))
(pop) ; 9
; Joined path conditions
(assert (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1)))
; [eval] at(ys, k)
(push) ; 9
(assert (at%precondition $Snap.unit ys@27@01 k@28@01))
(pop) ; 9
; Joined path conditions
(assert (at%precondition $Snap.unit ys@27@01 k@28@01))
(pop) ; 8
(push) ; 8
; [else-branch: 16 | !(0 <= k@28@01)]
(assert (not (<= 0 k@28@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (<= 0 k@28@01)
  (and
    (<= 0 k@28@01)
    (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1))
    (at%precondition $Snap.unit ys@27@01 k@28@01))))
; Joined path conditions
(assert (or (not (<= 0 k@28@01)) (<= 0 k@28@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@28@01 Int)) (!
  (and
    (=>
      (<= 0 k@28@01)
      (and
        (<= 0 k@28@01)
        (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1))
        (at%precondition $Snap.unit ys@27@01 k@28@01)))
    (or (not (<= 0 k@28@01)) (<= 0 k@28@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@53@16@53@69-aux|)))
(assert (forall ((k@28@01 Int)) (!
  (=>
    (<= 0 k@28@01)
    (and
      (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1))
      (at%precondition $Snap.unit ys@27@01 k@28@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@53@16@53@69_precondition|)))
(push) ; 6
(assert (not (forall ((k@28@01 Int)) (!
  (=>
    (and
      (=>
        (<= 0 k@28@01)
        (and
          (at%precondition $Snap.unit ys@19@01 (+ k@28@01 1))
          (at%precondition $Snap.unit ys@27@01 k@28@01)))
      (<= 0 k@28@01))
    (= (at $Snap.unit ys@19@01 (+ k@28@01 1)) (at $Snap.unit ys@27@01 k@28@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@53@16@53@69|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@28@01 Int)) (!
  (=>
    (<= 0 k@28@01)
    (= (at $Snap.unit ys@19@01 (+ k@28@01 1)) (at $Snap.unit ys@27@01 k@28@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@28@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@53@16@53@69|)))
; [exec]
; assert at(old_ys, 0) == at(xs, pos)
; [eval] at(old_ys, 0) == at(xs, pos)
; [eval] at(old_ys, 0)
(push) ; 6
(assert (at%precondition $Snap.unit ys@19@01 0))
(pop) ; 6
; Joined path conditions
(assert (at%precondition $Snap.unit ys@19@01 0))
; [eval] at(xs, pos)
(push) ; 6
(assert (at%precondition $Snap.unit xs@11@01 pos@20@01))
(pop) ; 6
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 pos@20@01))
(push) ; 6
(assert (not (= (at $Snap.unit ys@19@01 0) (at $Snap.unit xs@11@01 pos@20@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (at $Snap.unit ys@19@01 0) (at $Snap.unit xs@11@01 pos@20@01)))
; [exec]
; pos := pos + 1
; [eval] pos + 1
(declare-const pos@29@01 Int)
(assert (= pos@29@01 (+ pos@20@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= pos
(push) ; 6
(assert (not (<= 0 pos@29@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 pos@29@01))
; [eval] pos + len(ys) == len(xs)
; [eval] pos + len(ys)
; [eval] len(ys)
(push) ; 6
(assert (len%precondition $Snap.unit ys@27@01))
(pop) ; 6
; Joined path conditions
(assert (len%precondition $Snap.unit ys@27@01))
; [eval] len(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (= (+ pos@29@01 (len $Snap.unit ys@27@01)) (len $Snap.unit xs@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (+ pos@29@01 (len $Snap.unit ys@27@01)) (len $Snap.unit xs@11@01)))
; [eval] List_tag(ys) == 1 ==> pos == len(xs)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> ys@27@01) 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (List_tag<Int> ys@27@01) 1)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | List_tag[Int](ys@27@01) == 1 | live]
; [else-branch: 17 | List_tag[Int](ys@27@01) != 1 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | List_tag[Int](ys@27@01) == 1]
(assert (= (List_tag<Int> ys@27@01) 1))
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 17 | List_tag[Int](ys@27@01) != 1]
(assert (not (= (List_tag<Int> ys@27@01) 1)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= (List_tag<Int> ys@27@01) 1)) (= (List_tag<Int> ys@27@01) 1)))
(push) ; 6
(assert (not (=> (= (List_tag<Int> ys@27@01) 1) (= pos@29@01 (len $Snap.unit xs@11@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=> (= (List_tag<Int> ys@27@01) 1) (= pos@29@01 (len $Snap.unit xs@11@01))))
; [eval] (forall k: Int :: { at(ys, k) } 0 <= k ==> at(xs, pos + k) == at(ys, k))
(declare-const k@30@01 Int)
(push) ; 6
; [eval] 0 <= k ==> at(xs, pos + k) == at(ys, k)
; [eval] 0 <= k
(push) ; 7
; [then-branch: 18 | 0 <= k@30@01 | live]
; [else-branch: 18 | !(0 <= k@30@01) | live]
(push) ; 8
; [then-branch: 18 | 0 <= k@30@01]
(assert (<= 0 k@30@01))
; [eval] at(xs, pos + k) == at(ys, k)
; [eval] at(xs, pos + k)
; [eval] pos + k
(push) ; 9
(assert (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01)))
(pop) ; 9
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01)))
; [eval] at(ys, k)
(push) ; 9
(assert (at%precondition $Snap.unit ys@27@01 k@30@01))
(pop) ; 9
; Joined path conditions
(assert (at%precondition $Snap.unit ys@27@01 k@30@01))
(pop) ; 8
(push) ; 8
; [else-branch: 18 | !(0 <= k@30@01)]
(assert (not (<= 0 k@30@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (<= 0 k@30@01)
  (and
    (<= 0 k@30@01)
    (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
    (at%precondition $Snap.unit ys@27@01 k@30@01))))
; Joined path conditions
(assert (or (not (<= 0 k@30@01)) (<= 0 k@30@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@30@01 Int)) (!
  (and
    (=>
      (<= 0 k@30@01)
      (and
        (<= 0 k@30@01)
        (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
        (at%precondition $Snap.unit ys@27@01 k@30@01)))
    (or (not (<= 0 k@30@01)) (<= 0 k@30@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@30@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72-aux|)))
(assert (forall ((k@30@01 Int)) (!
  (=>
    (<= 0 k@30@01)
    (and
      (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
      (at%precondition $Snap.unit ys@27@01 k@30@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@30@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72_precondition|)))
(push) ; 6
(assert (not (forall ((k@30@01 Int)) (!
  (=>
    (and
      (=>
        (<= 0 k@30@01)
        (and
          (at%precondition $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
          (at%precondition $Snap.unit ys@27@01 k@30@01)))
      (<= 0 k@30@01))
    (=
      (at $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
      (at $Snap.unit ys@27@01 k@30@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@30@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@30@01 Int)) (!
  (=>
    (<= 0 k@30@01)
    (=
      (at $Snap.unit xs@11@01 (+ pos@29@01 k@30@01))
      (at $Snap.unit ys@27@01 k@30@01)))
  :pattern ((at%limited $Snap.unit ys@27@01 k@30@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@47@19@47@72|)))
; [eval] (forall k: Int :: { at(xs, k) } 0 <= k && k < pos ==> at(xs, k) != key)
(declare-const k@31@01 Int)
(push) ; 6
; [eval] 0 <= k && k < pos ==> at(xs, k) != key
; [eval] 0 <= k && k < pos
; [eval] 0 <= k
(push) ; 7
; [then-branch: 19 | !(0 <= k@31@01) | live]
; [else-branch: 19 | 0 <= k@31@01 | live]
(push) ; 8
; [then-branch: 19 | !(0 <= k@31@01)]
(assert (not (<= 0 k@31@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | 0 <= k@31@01]
(assert (<= 0 k@31@01))
; [eval] k < pos
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@31@01) (not (<= 0 k@31@01))))
(push) ; 7
; [then-branch: 20 | 0 <= k@31@01 && k@31@01 < pos@29@01 | live]
; [else-branch: 20 | !(0 <= k@31@01 && k@31@01 < pos@29@01) | live]
(push) ; 8
; [then-branch: 20 | 0 <= k@31@01 && k@31@01 < pos@29@01]
(assert (and (<= 0 k@31@01) (< k@31@01 pos@29@01)))
; [eval] at(xs, k) != key
; [eval] at(xs, k)
(push) ; 9
(assert (at%precondition $Snap.unit xs@11@01 k@31@01))
(pop) ; 9
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@31@01))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | !(0 <= k@31@01 && k@31@01 < pos@29@01)]
(assert (not (and (<= 0 k@31@01) (< k@31@01 pos@29@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (<= 0 k@31@01) (< k@31@01 pos@29@01))
  (and
    (<= 0 k@31@01)
    (< k@31@01 pos@29@01)
    (at%precondition $Snap.unit xs@11@01 k@31@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@31@01) (< k@31@01 pos@29@01)))
  (and (<= 0 k@31@01) (< k@31@01 pos@29@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@31@01 Int)) (!
  (and
    (or (<= 0 k@31@01) (not (<= 0 k@31@01)))
    (=>
      (and (<= 0 k@31@01) (< k@31@01 pos@29@01))
      (and
        (<= 0 k@31@01)
        (< k@31@01 pos@29@01)
        (at%precondition $Snap.unit xs@11@01 k@31@01)))
    (or
      (not (and (<= 0 k@31@01) (< k@31@01 pos@29@01)))
      (and (<= 0 k@31@01) (< k@31@01 pos@29@01))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@31@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73-aux|)))
(assert (forall ((k@31@01 Int)) (!
  (=>
    (and (<= 0 k@31@01) (< k@31@01 pos@29@01))
    (at%precondition $Snap.unit xs@11@01 k@31@01))
  :pattern ((at%limited $Snap.unit xs@11@01 k@31@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73_precondition|)))
(push) ; 6
(assert (not (forall ((k@31@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 k@31@01) (< k@31@01 pos@29@01))
        (at%precondition $Snap.unit xs@11@01 k@31@01))
      (and (<= 0 k@31@01) (< k@31@01 pos@29@01)))
    (not (= (at $Snap.unit xs@11@01 k@31@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@31@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@31@01 Int)) (!
  (=>
    (and (<= 0 k@31@01) (< k@31@01 pos@29@01))
    (not (= (at $Snap.unit xs@11@01 k@31@01) key@12@01)))
  :pattern ((at%limited $Snap.unit xs@11@01 k@31@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@48@19@48@73|)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01)]
(assert (not
  (and
    (not (= (List_tag<Int> ys@19@01) 1))
    (not (= (get_List_head<Int> ys@19@01) key@12@01)))))
(pop) ; 5
; [eval] !(!(List_tag(ys) == 1) && get_List_head(ys) != key)
; [eval] !(List_tag(ys) == 1) && get_List_head(ys) != key
; [eval] !(List_tag(ys) == 1)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 5
; [then-branch: 21 | List_tag[Int](ys@19@01) == 1 | live]
; [else-branch: 21 | List_tag[Int](ys@19@01) != 1 | live]
(push) ; 6
; [then-branch: 21 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
; [eval] get_List_head(ys) != key
; [eval] get_List_head(ys)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (not (= (List_tag<Int> ys@19@01) 1))
  (not (= (get_List_head<Int> ys@19@01) key@12@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (not (= (List_tag<Int> ys@19@01) 1))
    (not (= (get_List_head<Int> ys@19@01) key@12@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | !(List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01) | live]
; [else-branch: 22 | List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | !(List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01)]
(assert (not
  (and
    (not (= (List_tag<Int> ys@19@01) 1))
    (not (= (get_List_head<Int> ys@19@01) key@12@01)))))
; [exec]
; assert !(List_tag(ys) == 1) ==> at(ys, 0) == key
; [eval] !(List_tag(ys) == 1) ==> at(ys, 0) == key
; [eval] !(List_tag(ys) == 1)
; [eval] List_tag(ys) == 1
; [eval] List_tag(ys)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= (List_tag<Int> ys@19@01) 1)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= (List_tag<Int> ys@19@01) 1))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | List_tag[Int](ys@19@01) != 1 | live]
; [else-branch: 23 | List_tag[Int](ys@19@01) == 1 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 23 | List_tag[Int](ys@19@01) != 1]
(assert (not (= (List_tag<Int> ys@19@01) 1)))
; [eval] at(ys, 0) == key
; [eval] at(ys, 0)
(push) ; 8
(assert (at%precondition $Snap.unit ys@19@01 0))
(pop) ; 8
; Joined path conditions
(assert (at%precondition $Snap.unit ys@19@01 0))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | List_tag[Int](ys@19@01) == 1]
(assert (= (List_tag<Int> ys@19@01) 1))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= (List_tag<Int> ys@19@01) 1))
  (and
    (not (= (List_tag<Int> ys@19@01) 1))
    (at%precondition $Snap.unit ys@19@01 0))))
; Joined path conditions
(assert (or (= (List_tag<Int> ys@19@01) 1) (not (= (List_tag<Int> ys@19@01) 1))))
(push) ; 6
(assert (not (=>
  (not (= (List_tag<Int> ys@19@01) 1))
  (= (at $Snap.unit ys@19@01 0) key@12@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= (List_tag<Int> ys@19@01) 1))
  (= (at $Snap.unit ys@19@01 0) key@12@01)))
; [eval] 0 <= pos
; [eval] pos <= len(xs)
; [eval] len(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<= pos@20@01 (len $Snap.unit xs@11@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= pos@20@01 (len $Snap.unit xs@11@01)))
; [eval] at(xs, pos) == key || pos == len(xs)
; [eval] at(xs, pos) == key
; [eval] at(xs, pos)
(push) ; 6
(assert (at%precondition $Snap.unit xs@11@01 pos@20@01))
(pop) ; 6
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 pos@20@01))
(push) ; 6
; [then-branch: 24 | at(_, xs@11@01, pos@20@01) == key@12@01 | live]
; [else-branch: 24 | at(_, xs@11@01, pos@20@01) != key@12@01 | live]
(push) ; 7
; [then-branch: 24 | at(_, xs@11@01, pos@20@01) == key@12@01]
(assert (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | at(_, xs@11@01, pos@20@01) != key@12@01]
(assert (not (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01)))
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 8
(pop) ; 8
; Joined path conditions
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01))
  (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01)))
(push) ; 6
(assert (not (or
  (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01)
  (= pos@20@01 (len $Snap.unit xs@11@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (or
  (= (at $Snap.unit xs@11@01 pos@20@01) key@12@01)
  (= pos@20@01 (len $Snap.unit xs@11@01))))
; [eval] pos == len(xs) ==> (forall k: Int :: { at(xs, k) } 0 <= k && k < len(xs) ==> at(xs, k) != key)
; [eval] pos == len(xs)
; [eval] len(xs)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= pos@20@01 (len $Snap.unit xs@11@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= pos@20@01 (len $Snap.unit xs@11@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | pos@20@01 == len(_, xs@11@01) | live]
; [else-branch: 25 | pos@20@01 != len(_, xs@11@01) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 25 | pos@20@01 == len(_, xs@11@01)]
(assert (= pos@20@01 (len $Snap.unit xs@11@01)))
; [eval] (forall k: Int :: { at(xs, k) } 0 <= k && k < len(xs) ==> at(xs, k) != key)
(declare-const k@32@01 Int)
(push) ; 8
; [eval] 0 <= k && k < len(xs) ==> at(xs, k) != key
; [eval] 0 <= k && k < len(xs)
; [eval] 0 <= k
(push) ; 9
; [then-branch: 26 | !(0 <= k@32@01) | live]
; [else-branch: 26 | 0 <= k@32@01 | live]
(push) ; 10
; [then-branch: 26 | !(0 <= k@32@01)]
(assert (not (<= 0 k@32@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 26 | 0 <= k@32@01]
(assert (<= 0 k@32@01))
; [eval] k < len(xs)
; [eval] len(xs)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
(push) ; 9
; [then-branch: 27 | 0 <= k@32@01 && k@32@01 < len(_, xs@11@01) | live]
; [else-branch: 27 | !(0 <= k@32@01 && k@32@01 < len(_, xs@11@01)) | live]
(push) ; 10
; [then-branch: 27 | 0 <= k@32@01 && k@32@01 < len(_, xs@11@01)]
(assert (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01))))
; [eval] at(xs, k) != key
; [eval] at(xs, k)
(push) ; 11
(assert (at%precondition $Snap.unit xs@11@01 k@32@01))
(pop) ; 11
; Joined path conditions
(assert (at%precondition $Snap.unit xs@11@01 k@32@01))
(pop) ; 10
(push) ; 10
; [else-branch: 27 | !(0 <= k@32@01 && k@32@01 < len(_, xs@11@01))]
(assert (not (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))
  (and
    (<= 0 k@32@01)
    (< k@32@01 (len $Snap.unit xs@11@01))
    (at%precondition $Snap.unit xs@11@01 k@32@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01))))
  (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))))
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@32@01 Int)) (!
  (and
    (or (<= 0 k@32@01) (not (<= 0 k@32@01)))
    (=>
      (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))
      (and
        (<= 0 k@32@01)
        (< k@32@01 (len $Snap.unit xs@11@01))
        (at%precondition $Snap.unit xs@11@01 k@32@01)))
    (or
      (not (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01))))
      (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))))
  :pattern ((at%limited $Snap.unit xs@11@01 k@32@01))
  :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90-aux|)))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | pos@20@01 != len(_, xs@11@01)]
(assert (not (= pos@20@01 (len $Snap.unit xs@11@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= pos@20@01 (len $Snap.unit xs@11@01))
  (and
    (= pos@20@01 (len $Snap.unit xs@11@01))
    (forall ((k@32@01 Int)) (!
      (and
        (or (<= 0 k@32@01) (not (<= 0 k@32@01)))
        (=>
          (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))
          (and
            (<= 0 k@32@01)
            (< k@32@01 (len $Snap.unit xs@11@01))
            (at%precondition $Snap.unit xs@11@01 k@32@01)))
        (or
          (not (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01))))
          (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))))
      :pattern ((at%limited $Snap.unit xs@11@01 k@32@01))
      :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90-aux|)))))
; Joined path conditions
(assert (or
  (not (= pos@20@01 (len $Snap.unit xs@11@01)))
  (= pos@20@01 (len $Snap.unit xs@11@01))))
(push) ; 6
(assert (not (=>
  (= pos@20@01 (len $Snap.unit xs@11@01))
  (forall ((k@32@01 Int)) (!
    (=>
      (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))
      (not (= (at $Snap.unit xs@11@01 k@32@01) key@12@01)))
    :pattern ((at%limited $Snap.unit xs@11@01 k@32@01))
    :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90|)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= pos@20@01 (len $Snap.unit xs@11@01))
  (forall ((k@32@01 Int)) (!
    (=>
      (and (<= 0 k@32@01) (< k@32@01 (len $Snap.unit xs@11@01)))
      (not (= (at $Snap.unit xs@11@01 k@32@01) key@12@01)))
    :pattern ((at%limited $Snap.unit xs@11@01 k@32@01))
    :qid |prog./silicon/silver/src/test/resources/adt/example_3.vpr@37@32@37@90|))))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | List_tag[Int](ys@19@01) != 1 && get_List_head[Int](ys@19@01) != key@12@01]
(assert (and
  (not (= (List_tag<Int> ys@19@01) 1))
  (not (= (get_List_head<Int> ys@19@01) key@12@01))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
