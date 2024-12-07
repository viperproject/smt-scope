(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_functions.vpr
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
(declare-fun counter__get ($Snap $Ref) Int)
(declare-fun counter__get%limited ($Snap $Ref) Int)
(declare-fun counter__get%stateless ($Ref) Bool)
(declare-fun counter__get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun counter__state%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (= (counter__get%limited s@$ diz@0@00) (counter__get s@$ diz@0@00))
  :pattern ((counter__get s@$ diz@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (counter__get%stateless diz@0@00)
  :pattern ((counter__get%limited s@$ diz@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=>
    (counter__get%precondition s@$ diz@0@00)
    (= (counter__get s@$ diz@0@00) ($SortWrappers.$SnapToInt ($Snap.second s@$))))
  :pattern ((counter__get s@$ diz@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  true
  :pattern ((counter__get s@$ diz@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- counter__counter ----------
(declare-const current_thread_id@0@01 Int)
(declare-const v@1@01 Int)
(declare-const sys__result@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(declare-const v@4@01 Int)
(declare-const sys__result@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@5@01 $Ref.null)))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] counter__get(sys__result) == v
; [eval] counter__get(sys__result)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@7@01))) sys__result@5@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@7@01))) sys__result@5@01))
(assert (=
  (counter__get ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@7@01))) sys__result@5@01)
  v@4@01))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@8@01 $Ref)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@9@01 Int)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@10@01 Int)
; [exec]
; diz := new(counter__x)
(declare-const diz@11@01 $Ref)
(assert (not (= diz@11@01 $Ref.null)))
(declare-const counter__x@12@01 Int)
(assert (not (= diz@11@01 sys__result@5@01)))
(assert (not (= diz@11@01 diz@8@01)))
; [exec]
; __flatten_1 := v
; [exec]
; __flatten_3 := __flatten_1
; [exec]
; diz.counter__x := __flatten_3
; [exec]
; fold acc(counter__state(diz), write)
(assert (counter__state%trigger ($SortWrappers.IntTo$Snap v@4@01) diz@11@01))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(counter__state(sys__result), write) &&
;   counter__get(sys__result) == v)
; [eval] sys__result != null
; [eval] counter__get(sys__result) == v
; [eval] counter__get(sys__result)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.IntTo$Snap v@4@01)) diz@11@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.IntTo$Snap v@4@01)) diz@11@01))
(push) ; 3
(assert (not (=
  (counter__get ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap v@4@01)) diz@11@01)
  v@4@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (counter__get ($Snap.combine $Snap.unit ($SortWrappers.IntTo$Snap v@4@01)) diz@11@01)
  v@4@01))
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- counter__incr ----------
(declare-const diz@13@01 $Ref)
(declare-const current_thread_id@14@01 Int)
(declare-const diz@15@01 $Ref)
(declare-const current_thread_id@16@01 Int)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@16@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] counter__get(diz) == old(counter__get(diz)) + 1
; [eval] counter__get(diz)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine $Snap.unit ($Snap.first $t@18@01)) diz@15@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine $Snap.unit ($Snap.first $t@18@01)) diz@15@01))
; [eval] old(counter__get(diz)) + 1
; [eval] old(counter__get(diz))
; [eval] counter__get(diz)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second $t@17@01))) diz@15@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second $t@17@01))) diz@15@01))
(assert (=
  (counter__get ($Snap.combine $Snap.unit ($Snap.first $t@18@01)) diz@15@01)
  (+
    (counter__get ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second $t@17@01))) diz@15@01)
    1)))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@19@01 Int)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@20@01 Int)
; [exec]
; unfold acc(counter__state(diz), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (counter__state%trigger ($Snap.second ($Snap.second $t@17@01)) diz@15@01))
; [exec]
; __flatten_2 := diz.counter__x + 1
; [eval] diz.counter__x + 1
(declare-const __flatten_2@21@01 Int)
(assert (=
  __flatten_2@21@01
  (+ ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@17@01))) 1)))
; [exec]
; __flatten_4 := __flatten_2
; [exec]
; diz.counter__x := __flatten_4
; [exec]
; fold acc(counter__state(diz), write)
(assert (counter__state%trigger ($SortWrappers.IntTo$Snap __flatten_2@21@01) diz@15@01))
; [eval] counter__get(diz) == old(counter__get(diz)) + 1
; [eval] counter__get(diz)
(set-option :timeout 0)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.IntTo$Snap __flatten_2@21@01)) diz@15@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.IntTo$Snap __flatten_2@21@01)) diz@15@01))
; [eval] old(counter__get(diz)) + 1
; [eval] old(counter__get(diz))
; [eval] counter__get(diz)
(push) ; 3
; [eval] diz != null
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second $t@17@01))) diz@15@01))
(pop) ; 3
; Joined path conditions
(assert (counter__get%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second $t@17@01))) diz@15@01))
(push) ; 3
(assert (not (=
  (counter__get ($Snap.combine
    $Snap.unit
    ($SortWrappers.IntTo$Snap __flatten_2@21@01)) diz@15@01)
  (+
    (counter__get ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second $t@17@01))) diz@15@01)
    1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (counter__get ($Snap.combine
    $Snap.unit
    ($SortWrappers.IntTo$Snap __flatten_2@21@01)) diz@15@01)
  (+
    (counter__get ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second $t@17@01))) diz@15@01)
    1)))
(pop) ; 2
(pop) ; 1
