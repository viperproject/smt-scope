(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0365.vpr
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
(declare-sort parallelHeaps 0)
(declare-sort Epsilon 0)
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
(declare-fun $SortWrappers.parallelHeapsTo$Snap (parallelHeaps) $Snap)
(declare-fun $SortWrappers.$SnapToparallelHeaps ($Snap) parallelHeaps)
(assert (forall ((x parallelHeaps)) (!
    (= x ($SortWrappers.$SnapToparallelHeaps($SortWrappers.parallelHeapsTo$Snap x)))
    :pattern (($SortWrappers.parallelHeapsTo$Snap x))
    :qid |$Snap.$SnapToparallelHeapsTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.parallelHeapsTo$Snap($SortWrappers.$SnapToparallelHeaps x)))
    :pattern (($SortWrappers.$SnapToparallelHeaps x))
    :qid |$Snap.parallelHeapsTo$SnapToparallelHeaps|
    )))
(declare-fun $SortWrappers.EpsilonTo$Snap (Epsilon) $Snap)
(declare-fun $SortWrappers.$SnapToEpsilon ($Snap) Epsilon)
(assert (forall ((x Epsilon)) (!
    (= x ($SortWrappers.$SnapToEpsilon($SortWrappers.EpsilonTo$Snap x)))
    :pattern (($SortWrappers.EpsilonTo$Snap x))
    :qid |$Snap.$SnapToEpsilonTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.EpsilonTo$Snap($SortWrappers.$SnapToEpsilon x)))
    :pattern (($SortWrappers.$SnapToEpsilon x))
    :qid |$Snap.EpsilonTo$SnapToEpsilon|
    )))
; ////////// Symbols
(declare-const eps<Perm> $Perm)
(declare-fun temp<Ref> ($Ref) $Ref)
(declare-fun temp_inv<Ref> ($Ref) $Ref)
(declare-fun heap<Int> ($Ref) Int)
(declare-fun is_ghost<Bool> ($Ref) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun resource ($Snap) $Ref)
(declare-fun resource%limited ($Snap) $Ref)
(declare-const resource%stateless Bool)
(declare-fun resource%precondition ($Snap) Bool)
(declare-fun tokCountRef ($Snap $Ref) $Ref)
(declare-fun tokCountRef%limited ($Snap $Ref) $Ref)
(declare-fun tokCountRef%stateless ($Ref) Bool)
(declare-fun tokCountRef%precondition ($Snap $Ref) Bool)
(declare-fun readers ($Snap) $Ref)
(declare-fun readers%limited ($Snap) $Ref)
(declare-const readers%stateless Bool)
(declare-fun readers%precondition ($Snap) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (> (as eps<Perm>  $Perm) $Perm.No))
(assert (forall ((r $Ref)) (!
  (and
    (= (temp_inv<Ref> (temp<Ref> r)) r)
    (ite
      (is_ghost<Bool> r)
      (= (temp<Ref> r) r)
      (= (heap<Int> (temp<Ref> r)) (- (heap<Int> r) 3))))
  :pattern ((temp<Ref> r))
  :qid |prog.inv_temp|)))
(assert (forall ((r $Ref)) (!
  (and
    (= (temp<Ref> (temp_inv<Ref> r)) r)
    (ite
      (is_ghost<Bool> r)
      (= (temp_inv<Ref> r) r)
      (= (heap<Int> (temp_inv<Ref> r)) (+ (heap<Int> r) 3))))
  :pattern ((temp_inv<Ref> r))
  :qid |prog.inv_temp_inv|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap)) (!
  (= (resource%limited s@$) (resource s@$))
  :pattern ((resource s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as resource%stateless  Bool)
  :pattern ((resource%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (= (tokCountRef%limited s@$ r@1@00) (tokCountRef s@$ r@1@00))
  :pattern ((tokCountRef s@$ r@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (tokCountRef%stateless r@1@00)
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (let ((result@2@00 (tokCountRef%limited s@$ r@1@00))) (=>
    (tokCountRef%precondition s@$ r@1@00)
    (= (tokCountRef%limited $Snap.unit (temp<Ref> r@1@00)) result@2@00)))
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@1@00 $Ref)) (!
  (let ((result@2@00 (tokCountRef%limited s@$ r@1@00))) (=>
    (tokCountRef%precondition s@$ r@1@00)
    (tokCountRef%precondition $Snap.unit (temp<Ref> r@1@00))))
  :pattern ((tokCountRef%limited s@$ r@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap)) (!
  (= (readers%limited s@$) (readers s@$))
  :pattern ((readers s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (as readers%stateless  Bool)
  :pattern ((readers%limited s@$))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- try_lock_shared ----------
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
; var v0: Int
(declare-const v0@0@01 Int)
; [exec]
; var v1: Int
(declare-const v1@1@01 Int)
; [exec]
; v1 := havocedInt()
(declare-const res@2@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale 1 / 1 - (v1 / 4 + 1) * eps() >= none
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] 1 / 1 - (v1 / 4 + 1) * eps() >= none
; [eval] 1 / 1 - (v1 / 4 + 1) * eps()
; [eval] (v1 / 4 + 1) * eps()
; [eval] v1 / 4 + 1
; [eval] v1 / 4
; [eval] eps()
(assert (>=
  (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))
  $Perm.No))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale v1 >= 0 &&
;   (acc(tokCountRef(resource()).tokCount, 1 / 1 - (v1 / 4 + 1) * eps()) &&
;   acc(tokCountRef(readers()).tokCount, 1 / 1 - v1 / 4 * eps()))
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] v1 >= 0
(assert (>= res@2@01 0))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
; [eval] tokCountRef(resource())
; [eval] resource()
(set-option :timeout 0)
(push) ; 3
(assert (resource%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (resource%precondition $Snap.unit))
(push) ; 3
(assert (tokCountRef%precondition $Snap.unit (resource $Snap.unit)))
(pop) ; 3
; Joined path conditions
(assert (tokCountRef%precondition $Snap.unit (resource $Snap.unit)))
; [eval] 1 / 1 - (v1 / 4 + 1) * eps()
; [eval] (v1 / 4 + 1) * eps()
; [eval] v1 / 4 + 1
; [eval] v1 / 4
; [eval] eps()
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))
    $Perm.No)
  (<
    $Perm.No
    (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))))
(assert (<=
  (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm))))
  (not (= (tokCountRef $Snap.unit (resource $Snap.unit)) $Ref.null))))
; [eval] tokCountRef(readers())
; [eval] readers()
(push) ; 3
(assert (readers%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (readers%precondition $Snap.unit))
(push) ; 3
(assert (tokCountRef%precondition $Snap.unit (readers $Snap.unit)))
(pop) ; 3
; Joined path conditions
(assert (tokCountRef%precondition $Snap.unit (readers $Snap.unit)))
; [eval] 1 / 1 - v1 / 4 * eps()
; [eval] v1 / 4 * eps()
; [eval] v1 / 4
; [eval] eps()
(push) ; 3
(assert (not (or
  (=
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
    $Perm.No)
  (<
    $Perm.No
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (tokCountRef $Snap.unit (resource $Snap.unit))
  (tokCountRef $Snap.unit (readers $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))))
(assert (<=
  (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm))))
  (not (= (tokCountRef $Snap.unit (readers $Snap.unit)) $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v0 := v1 / 4
; [eval] v1 / 4
(declare-const v0@5@01 Int)
(assert (= v0@5@01 (div res@2@01 4)))
; [exec]
; inhale 1 / 1 > v0 * eps() / 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] 1 / 1 > v0 * eps() / 1
; [eval] v0 * eps() / 1
; [eval] v0 * eps()
; [eval] eps()
(assert (> $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(tokCountRef(readers()).tokCount) >= 1 / 1 - v0 * eps() / 1
; [eval] perm(tokCountRef(readers()).tokCount) >= 1 / 1 - v0 * eps() / 1
; [eval] perm(tokCountRef(readers()).tokCount)
; [eval] tokCountRef(readers())
; [eval] readers()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] 1 / 1 - v0 * eps() / 1
; [eval] v0 * eps() / 1
; [eval] v0 * eps()
; [eval] eps()
(push) ; 3
(assert (not (>=
  (+
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
    (ite
      (=
        (tokCountRef $Snap.unit (readers $Snap.unit))
        (tokCountRef $Snap.unit (resource $Snap.unit)))
      (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))
      $Perm.No))
  (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  (+
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
    (ite
      (=
        (tokCountRef $Snap.unit (readers $Snap.unit))
        (tokCountRef $Snap.unit (resource $Snap.unit)))
      (- $Perm.Write (* (to_real (+ (div res@2@01 4) 1)) (as eps<Perm>  $Perm)))
      $Perm.No))
  (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))))
; [exec]
; assert acc(tokCountRef(readers()).tokCount, 1 / 1 - v0 * eps() / 1)
; [eval] 1 / 1 - v0 * eps() / 1
; [eval] v0 * eps() / 1
; [eval] v0 * eps()
; [eval] eps()
; [eval] tokCountRef(readers())
; [eval] readers()
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (or
  (= (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm))) $Perm.No)
  (< $Perm.No (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (-
    (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
    ($Perm.min
      (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
      (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (or
  (=
    (-
      (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))
      ($Perm.min
        (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
        (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))))
    $Perm.No)
  (<
    (-
      (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))
      ($Perm.min
        (- $Perm.Write (* (to_real (div res@2@01 4)) (as eps<Perm>  $Perm)))
        (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm)))))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (- $Perm.Write (* (to_real v0@5@01) (as eps<Perm>  $Perm))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- havocedInt ----------
(declare-const res@7@01 Int)
(declare-const res@8@01 Int)
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
; inhale false
(pop) ; 2
(pop) ; 1
