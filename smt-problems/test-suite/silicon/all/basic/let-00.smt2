(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/let.vpr
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
(declare-fun fun01 ($Snap $Ref) Int)
(declare-fun fun01%limited ($Snap $Ref) Int)
(declare-fun fun01%stateless ($Ref) Bool)
(declare-fun fun01%precondition ($Snap $Ref) Bool)
(declare-fun fun02 ($Snap $Ref) Int)
(declare-fun fun02%limited ($Snap $Ref) Int)
(declare-fun fun02%stateless ($Ref) Bool)
(declare-fun fun02%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@6@00 () $Perm)
(declare-fun $k@7@00 () $Perm)
(declare-fun letvar@8@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (fun01%limited s@$ x@0@00) (fun01 s@$ x@0@00))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (fun01%stateless x@0@00)
  :pattern ((fun01%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun01%limited s@$ x@0@00))) (and
    ($Perm.isReadVar $k@4@00)
    (=> (fun01%precondition s@$ x@0@00) (> result@1@00 0))))
  :pattern ((fun01%limited s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun01%limited s@$ x@0@00))) true)
  :pattern ((fun01%limited s@$ x@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    (=>
      (fun01%precondition s@$ x@0@00)
      (= (fun01 s@$ x@0@00) ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((fun01 s@$ x@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (fun02%limited s@$ x@2@00) (fun02 s@$ x@2@00))
  :pattern ((fun02 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (fun02%stateless x@2@00)
  :pattern ((fun02%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun02%precondition s@$ x@2@00)
    (=
      (fun02 s@$ x@2@00)
      (let ((y ($SortWrappers.$SnapToInt s@$))) (+
        y
        ($SortWrappers.$SnapToInt s@$)))))
  :pattern ((fun02 s@$ x@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun02%precondition s@$ x@2@00)
    (let ((y ($SortWrappers.$SnapToInt s@$))) true))
  :pattern ((fun02 s@$ x@2@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test00 ----------
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
; assert (let y ==
;     (0) in
;     y == 0)
; [eval] (let y == (0) in y == 0)
(declare-const letvar@0@01 Int)
(assert (= (as letvar@0@01  Int) 0))
; [eval] y == 0
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(declare-const x@1@01 Int)
(declare-const x@2@01 Int)
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
; assert (let y ==
;     (x + x) in
;     y == 2 * x)
; [eval] (let y == (x + x) in y == 2 * x)
; [eval] x + x
(declare-const letvar@3@01 Int)
(assert (= (as letvar@3@01  Int) (+ x@2@01 x@2@01)))
; [eval] y == 2 * x
; [eval] 2 * x
(push) ; 3
(assert (not (= (+ x@2@01 x@2@01) (* 2 x@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (+ x@2@01 x@2@01) (* 2 x@2@01)))
; [exec]
; assert 2 * x == (let y == (x + x) in y)
; [eval] 2 * x == (let y == (x + x) in y)
; [eval] 2 * x
; [eval] (let y == (x + x) in y)
; [eval] x + x
(declare-const letvar@4@01 Int)
(assert (= (as letvar@4@01  Int) (+ x@2@01 x@2@01)))
(push) ; 3
(assert (not (= (* 2 x@2@01) (+ x@2@01 x@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (* 2 x@2@01) (+ x@2@01 x@2@01)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@5@01 $Ref)
(declare-const x@6@01 $Ref)
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
; inhale acc(P(x), write)
(declare-const $t@7@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (let y ==
;     (fun01(x)) in
;     y * y + y > 0)
; [eval] (let y == (fun01(x)) in y * y + y > 0)
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (< $k@8@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@8@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (fun01%precondition $t@7@01 x@6@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and
  (< $k@8@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@8@01))
  (fun01%precondition $t@7@01 x@6@01)))
(declare-const letvar@9@01 Int)
(assert (= (as letvar@9@01  Int) (fun01 $t@7@01 x@6@01)))
; [eval] y * y + y > 0
; [eval] y * y + y
; [eval] y * y
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (+ (* (fun01 $t@7@01 x@6@01) (fun01 $t@7@01 x@6@01)) (fun01 $t@7@01 x@6@01))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  (+ (* (fun01 $t@7@01 x@6@01) (fun01 $t@7@01 x@6@01)) (fun01 $t@7@01 x@6@01))
  0))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@10@01 $Ref)
(declare-const x@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 Int)
(assert (not (= x@11@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert fun02(x) == 2 * x.g
; [eval] fun02(x) == 2 * x.g
; [eval] fun02(x)
(push) ; 3
(assert (fun02%precondition ($SortWrappers.IntTo$Snap $t@12@01) x@11@01))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($SortWrappers.IntTo$Snap $t@12@01) x@11@01))
; [eval] 2 * x.g
(push) ; 3
(assert (not (= (fun02 ($SortWrappers.IntTo$Snap $t@12@01) x@11@01) (* 2 $t@12@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fun02 ($SortWrappers.IntTo$Snap $t@12@01) x@11@01) (* 2 $t@12@01)))
(pop) ; 2
(pop) ; 1
