(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:47:27
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0097.vpr
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
; ////////// Symbols
; Declaring symbols related to program functions (from program analysis)
(declare-fun func3 ($Snap Int Int Bool) Bool)
(declare-fun func3%limited ($Snap Int Int Bool) Bool)
(declare-fun func3%stateless (Int Int Bool) Bool)
(declare-fun func3%precondition ($Snap Int Int Bool) Bool)
(declare-fun sum_fail ($Snap $Ref) Int)
(declare-fun sum_fail%limited ($Snap $Ref) Int)
(declare-fun sum_fail%stateless ($Ref) Bool)
(declare-fun sum_fail%precondition ($Snap $Ref) Bool)
(declare-fun sum_ok ($Snap $Ref) $Ref)
(declare-fun sum_ok%limited ($Snap $Ref) $Ref)
(declare-fun sum_ok%stateless ($Ref) Bool)
(declare-fun sum_ok%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun valid__List%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION func3----------
(declare-fun x@0@00 () Int)
(declare-fun y@1@00 () Int)
(declare-fun z@2@00 () Bool)
(declare-fun result@3@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] result == (x != y)
; [eval] x != y
(assert (= result@3@00 (not (= x@0@00 y@1@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Bool)) (!
  (= (func3%limited s@$ x@0@00 y@1@00 z@2@00) (func3 s@$ x@0@00 y@1@00 z@2@00))
  :pattern ((func3 s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Bool)) (!
  (func3%stateless x@0@00 y@1@00 z@2@00)
  :pattern ((func3%limited s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Bool)) (!
  (let ((result@3@00 (func3%limited s@$ x@0@00 y@1@00 z@2@00))) (=>
    (func3%precondition s@$ x@0@00 y@1@00 z@2@00)
    (= result@3@00 (not (= x@0@00 y@1@00)))))
  :pattern ((func3%limited s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Bool)) (!
  (let ((result@3@00 (func3%limited s@$ x@0@00 y@1@00 z@2@00))) true)
  :pattern ((func3%limited s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (let eq_0 == (x == y) in (let something_0 == (y == x || x == x) in eq_0 && something_0))
; [eval] x == y
(declare-fun letvar@9@00 ($Snap Int Int Bool) Bool)
(assert (= (letvar@9@00 s@$ x@0@00 y@1@00 z@2@00) (= x@0@00 y@1@00)))
; [eval] (let something_0 == (y == x || x == x) in eq_0 && something_0)
; [eval] y == x || x == x
; [eval] y == x
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | y@1@00 == x@0@00 | live]
; [else-branch: 0 | y@1@00 != x@0@00 | live]
(push) ; 3
; [then-branch: 0 | y@1@00 == x@0@00]
(assert (= y@1@00 x@0@00))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | y@1@00 != x@0@00]
(assert (not (= y@1@00 x@0@00)))
; [eval] x == x
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= y@1@00 x@0@00)) (= y@1@00 x@0@00)))
(declare-fun letvar@10@00 ($Snap Int Int Bool) Bool)
(assert (= (letvar@10@00 s@$ x@0@00 y@1@00 z@2@00) true))
; [eval] eq_0 && something_0
(push) ; 2
; [then-branch: 1 | x@0@00 != y@1@00 | live]
; [else-branch: 1 | x@0@00 == y@1@00 | live]
(push) ; 3
; [then-branch: 1 | x@0@00 != y@1@00]
(assert (not (= x@0@00 y@1@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@0@00 == y@1@00]
(assert (= x@0@00 y@1@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (= x@0@00 y@1@00) (not (= x@0@00 y@1@00))))
(assert (= result@3@00 (= x@0@00 y@1@00)))
; [eval] result == (x != y)
; [eval] x != y
(push) ; 2
(assert (not (= result@3@00 (not (= x@0@00 y@1@00)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == (x != y)
; [eval] x != y
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@3@00 (not (= x@0@00 y@1@00)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == (x != y)
; [eval] x != y
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@3@00 (not (= x@0@00 y@1@00)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] result == (x != y)
; [eval] x != y
(set-option :timeout 0)
(push) ; 2
(assert (not (= result@3@00 (not (= x@0@00 y@1@00)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(pop) ; 1
; ---------- FUNCTION sum_fail----------
(declare-fun l@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No $k@11@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@4@00 $Ref)) (!
  (= (sum_fail%limited s@$ l@4@00) (sum_fail s@$ l@4@00))
  :pattern ((sum_fail s@$ l@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (l@4@00 $Ref)) (!
  (sum_fail%stateless l@4@00)
  :pattern ((sum_fail%limited s@$ l@4@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No $k@11@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid__List(l), wildcard) in (let c == (l.List__Node__0) in c.Int__v))
(declare-const $k@12@00 $Perm)
(assert ($Perm.isReadVar $k@12@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@11@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@13@00 $k@11@00))
(assert (<= $Perm.No (- $k@11@00 $k@13@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid__List%trigger s@$ l@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@12@00))
(assert (<= $k@12@00 $Perm.Write))
(assert (=> (< $Perm.No $k@12@00) (not (= l@4@00 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No $k@12@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
; [eval] (let c == (l.List__Node__0) in c.Int__v)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun letvar@14@00 ($Snap $Ref) $Ref)
(assert (= (letvar@14@00 s@$ l@4@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@13@00))
(assert (and
  (< $k@13@00 $k@11@00)
  (<= $Perm.No (- $k@11@00 $k@13@00))
  (valid__List%trigger s@$ l@4@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@12@00)
  (<= $k@12@00 $Perm.Write)
  (=> (< $Perm.No $k@12@00) (not (= l@4@00 $Ref.null)))
  (=>
    (< $Perm.No $k@12@00)
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  (= (letvar@14@00 s@$ l@4@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(assert (= result@5@00 ($SortWrappers.$SnapToInt ($Snap.second s@$))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@11@00)
    ($Perm.isReadVar $k@12@00)
    ($Perm.isReadVar $k@13@00)
    (=>
      (sum_fail%precondition s@$ l@4@00)
      (=
        (sum_fail s@$ l@4@00)
        (let ((c ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) ($SortWrappers.$SnapToInt ($Snap.second s@$))))))
  :pattern ((sum_fail s@$ l@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (l@4@00 $Ref)) (!
  (=>
    (sum_fail%precondition s@$ l@4@00)
    (let ((c ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) true))
  :pattern ((sum_fail s@$ l@4@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION sum_ok----------
(declare-fun l@6@00 () $Ref)
(declare-fun result@7@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(assert (<= $Perm.No $k@15@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@6@00 $Ref)) (!
  (= (sum_ok%limited s@$ l@6@00) (sum_ok s@$ l@6@00))
  :pattern ((sum_ok s@$ l@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (l@6@00 $Ref)) (!
  (sum_ok%stateless l@6@00)
  :pattern ((sum_ok%limited s@$ l@6@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@15@00))
(assert (<= $Perm.No $k@15@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(valid__List(l), wildcard) in (let c == (l.List__Node__0) in c))
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@15@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@17@00 $k@15@00))
(assert (<= $Perm.No (- $k@15@00 $k@17@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid__List%trigger s@$ l@6@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@16@00))
(assert (<= $k@16@00 $Perm.Write))
(assert (=> (< $Perm.No $k@16@00) (not (= l@6@00 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No $k@16@00)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))))
; [eval] (let c == (l.List__Node__0) in c)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun letvar@18@00 ($Snap $Ref) $Ref)
(assert (= (letvar@18@00 s@$ l@6@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@17@00))
(assert (and
  (< $k@17@00 $k@15@00)
  (<= $Perm.No (- $k@15@00 $k@17@00))
  (valid__List%trigger s@$ l@6@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@16@00)
  (<= $k@16@00 $Perm.Write)
  (=> (< $Perm.No $k@16@00) (not (= l@6@00 $Ref.null)))
  (=>
    (< $Perm.No $k@16@00)
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)))
  (= (letvar@18@00 s@$ l@6@00) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
(assert (= result@7@00 ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (l@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    (=>
      (sum_ok%precondition s@$ l@6@00)
      (=
        (sum_ok s@$ l@6@00)
        (let ((c ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) c))))
  :pattern ((sum_ok s@$ l@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (l@6@00 $Ref)) (!
  (=>
    (sum_ok%precondition s@$ l@6@00)
    (let ((c ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))) true))
  :pattern ((sum_ok s@$ l@6@00))
  :qid |quant-u-11|)))
; ---------- valid__List ----------
(declare-const this@19@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@20@00 $Snap)
(assert (= $t@20@00 ($Snap.combine ($Snap.first $t@20@00) ($Snap.second $t@20@00))))
(assert (not (= this@19@00 $Ref.null)))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@20@00)) $Ref.null)))
(pop) ; 1
