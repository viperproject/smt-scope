(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr
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
(declare-sort GlobalKPermission 0)
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
(declare-fun $SortWrappers.GlobalKPermissionTo$Snap (GlobalKPermission) $Snap)
(declare-fun $SortWrappers.$SnapToGlobalKPermission ($Snap) GlobalKPermission)
(assert (forall ((x GlobalKPermission)) (!
    (= x ($SortWrappers.$SnapToGlobalKPermission($SortWrappers.GlobalKPermissionTo$Snap x)))
    :pattern (($SortWrappers.GlobalKPermissionTo$Snap x))
    :qid |$Snap.$SnapToGlobalKPermissionTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.GlobalKPermissionTo$Snap($SortWrappers.$SnapToGlobalKPermission x)))
    :pattern (($SortWrappers.$SnapToGlobalKPermission x))
    :qid |$Snap.GlobalKPermissionTo$SnapToGlobalKPermission|
    )))
; ////////// Symbols
(declare-const globalK$<Perm> $Perm)
; Declaring symbols related to program functions (from program analysis)
(declare-fun Triggersf$ ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersf$%limited ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersf$%stateless ($Ref Int Int Int) Bool)
(declare-fun Triggersf$%precondition ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersg$ ($Snap $Ref Int) Bool)
(declare-fun Triggersg$%limited ($Snap $Ref Int) Bool)
(declare-fun Triggersg$%stateless ($Ref Int) Bool)
(declare-fun Triggersg$%precondition ($Snap $Ref Int) Bool)
(declare-fun Triggersh$ ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersh$%limited ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersh$%stateless ($Ref Int Int Int) Bool)
(declare-fun Triggersh$%precondition ($Snap $Ref Int Int Int) Bool)
(declare-fun Triggersi$ ($Snap $Ref Int Bool) Bool)
(declare-fun Triggersi$%limited ($Snap $Ref Int Bool) Bool)
(declare-fun Triggersi$%stateless ($Ref Int Bool) Bool)
(declare-fun Triggersi$%precondition ($Snap $Ref Int Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Triggers$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun Triggersvalid$%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert true)
; ////////// Axioms
(assert (and
  (> (as globalK$<Perm>  $Perm) $Perm.No)
  (> $Perm.Write (as globalK$<Perm>  $Perm))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun $k@20@00 () $Perm)
(declare-fun $k@21@00 () $Perm)
(declare-fun $k@22@00 () $Perm)
(declare-fun $k@23@00 () $Perm)
(declare-fun $k@24@00 () $Perm)
(declare-fun $k@25@00 () $Perm)
(declare-fun $k@26@00 () $Perm)
(declare-fun $k@27@00 () $Perm)
(declare-fun $k@28@00 () $Perm)
(declare-fun $k@29@00 () $Perm)
(declare-fun $k@30@00 () $Perm)
(declare-fun $k@31@00 () $Perm)
(declare-fun $k@32@00 () $Perm)
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (x@1@00 Int) (y@2@00 Int) (z@3@00 Int)) (!
  (=
    (Triggersf$%limited s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00)
    (Triggersf$ s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00))
  :pattern ((Triggersf$ s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (x@1@00 Int) (y@2@00 Int) (z@3@00 Int)) (!
  (Triggersf$%stateless this$_2@0@00 x@1@00 y@2@00 z@3@00)
  :pattern ((Triggersf$%limited s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (x@1@00 Int) (y@2@00 Int) (z@3@00 Int)) (!
  (and
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    (=>
      (Triggersf$%precondition s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00)
      (=
        (Triggersf$ s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00)
        (Triggersf$%limited ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@1@00 y@2@00 z@3@00))))
  :pattern ((Triggersf$ s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00))
  :pattern ((Triggersf$%stateless this$_2@0@00 x@1@00 y@2@00 z@3@00) (Triggersvalid$%trigger ($Snap.second s@$) this$_2@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref) (x@1@00 Int) (y@2@00 Int) (z@3@00 Int)) (!
  (=>
    (Triggersf$%precondition s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00)
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@1@00 y@2@00 z@3@00))
  :pattern ((Triggersf$ s@$ this$_2@0@00 x@1@00 y@2@00 z@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this$_4@5@00 $Ref) (x@6@00 Int)) (!
  (=
    (Triggersg$%limited s@$ this$_4@5@00 x@6@00)
    (Triggersg$ s@$ this$_4@5@00 x@6@00))
  :pattern ((Triggersg$ s@$ this$_4@5@00 x@6@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_4@5@00 $Ref) (x@6@00 Int)) (!
  (Triggersg$%stateless this$_4@5@00 x@6@00)
  :pattern ((Triggersg$%limited s@$ this$_4@5@00 x@6@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this$_4@5@00 $Ref) (x@6@00 Int)) (!
  (and
    ($Perm.isReadVar $k@21@00)
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    (=>
      (Triggersg$%precondition s@$ this$_4@5@00 x@6@00)
      (=
        (Triggersg$ s@$ this$_4@5@00 x@6@00)
        (Triggersg$%limited ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@6@00))))
  :pattern ((Triggersg$ s@$ this$_4@5@00 x@6@00))
  :pattern ((Triggersg$%stateless this$_4@5@00 x@6@00) (Triggersvalid$%trigger ($Snap.second s@$) this$_4@5@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this$_4@5@00 $Ref) (x@6@00 Int)) (!
  (=>
    (Triggersg$%precondition s@$ this$_4@5@00 x@6@00)
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@6@00))
  :pattern ((Triggersg$ s@$ this$_4@5@00 x@6@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (this$_3@8@00 $Ref) (x@9@00 Int) (y@10@00 Int) (z@11@00 Int)) (!
  (=
    (Triggersh$%limited s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00)
    (Triggersh$ s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00))
  :pattern ((Triggersh$ s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_3@8@00 $Ref) (x@9@00 Int) (y@10@00 Int) (z@11@00 Int)) (!
  (Triggersh$%stateless this$_3@8@00 x@9@00 y@10@00 z@11@00)
  :pattern ((Triggersh$%limited s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this$_3@8@00 $Ref) (x@9@00 Int) (y@10@00 Int) (z@11@00 Int)) (!
  (and
    ($Perm.isReadVar $k@25@00)
    ($Perm.isReadVar $k@26@00)
    ($Perm.isReadVar $k@27@00)
    ($Perm.isReadVar $k@28@00)
    (=>
      (Triggersh$%precondition s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00)
      (=
        (Triggersh$ s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00)
        (Triggersh$%limited ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@9@00 y@10@00 z@11@00))))
  :pattern ((Triggersh$ s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00))
  :pattern ((Triggersh$%stateless this$_3@8@00 x@9@00 y@10@00 z@11@00) (Triggersvalid$%trigger ($Snap.second s@$) this$_3@8@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this$_3@8@00 $Ref) (x@9@00 Int) (y@10@00 Int) (z@11@00 Int)) (!
  (=>
    (Triggersh$%precondition s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00)
    (Triggersh$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@9@00 y@10@00 z@11@00))
  :pattern ((Triggersh$ s@$ this$_3@8@00 x@9@00 y@10@00 z@11@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (this$_5@13@00 $Ref) (x@14@00 Int) (y@15@00 Bool)) (!
  (=
    (Triggersi$%limited s@$ this$_5@13@00 x@14@00 y@15@00)
    (Triggersi$ s@$ this$_5@13@00 x@14@00 y@15@00))
  :pattern ((Triggersi$ s@$ this$_5@13@00 x@14@00 y@15@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this$_5@13@00 $Ref) (x@14@00 Int) (y@15@00 Bool)) (!
  (Triggersi$%stateless this$_5@13@00 x@14@00 y@15@00)
  :pattern ((Triggersi$%limited s@$ this$_5@13@00 x@14@00 y@15@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this$_5@13@00 $Ref) (x@14@00 Int) (y@15@00 Bool)) (!
  (and
    ($Perm.isReadVar $k@29@00)
    ($Perm.isReadVar $k@30@00)
    ($Perm.isReadVar $k@31@00)
    ($Perm.isReadVar $k@32@00)
    (=>
      (Triggersi$%precondition s@$ this$_5@13@00 x@14@00 y@15@00)
      (=
        (Triggersi$ s@$ this$_5@13@00 x@14@00 y@15@00)
        (Triggersi$%limited ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@14@00 y@15@00))))
  :pattern ((Triggersi$ s@$ this$_5@13@00 x@14@00 y@15@00))
  :pattern ((Triggersi$%stateless this$_5@13@00 x@14@00 y@15@00) (Triggersvalid$%trigger ($Snap.second s@$) this$_5@13@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this$_5@13@00 $Ref) (x@14@00 Int) (y@15@00 Bool)) (!
  (=>
    (Triggersi$%precondition s@$ this$_5@13@00 x@14@00 y@15@00)
    (Triggersi$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) x@14@00 y@15@00))
  :pattern ((Triggersi$ s@$ this$_5@13@00 x@14@00 y@15@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Triggerstriggers_one$ ----------
(declare-const this$_6@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const this$_6@2@01 $Ref)
(declare-const k$@3@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] this$_6 != null
(assert (not (= this$_6@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] k$ > none
(assert (> k$@3@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] write > k$
(assert (> $Perm.Write k$@3@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  $Snap.unit))
; [eval] (forall a: Int :: { Triggersg$(this$_6, a) } true ==> !(Triggersg$(this$_6, a) ==> false))
(declare-const a@5@01 Int)
(push) ; 2
; [eval] true ==> !(Triggersg$(this$_6, a) ==> false)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
; [eval] !(Triggersg$(this$_6, a) ==> false)
; [eval] Triggersg$(this$_6, a) ==> false
; [eval] Triggersg$(this$_6, a)
(push) ; 5
; [eval] this$_4 != null
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert (and
  (< $k@6@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@6@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | Triggersg$((_, First:(Second:(Second:(Second:($t@4@01))))), this$_6@2@01, a@5@01) | live]
; [else-branch: 1 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@4@01))))), this$_6@2@01, a@5@01)) | live]
(push) ; 6
; [then-branch: 1 | Triggersg$((_, First:(Second:(Second:(Second:($t@4@01))))), this$_6@2@01, a@5@01)]
(assert (Triggersg$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@4@01))))), this$_6@2@01, a@5@01))]
(assert (not
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert (and
  (< $k@6@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@6@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)
  (or
    (not
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@5@01 Int)) (!
  (and
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)
    (or
      (not
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@92@13@92@74-aux|)))
(assert (forall ((a@5@01 Int)) (!
  (not
    (=>
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01)
      false))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 a@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@92@13@92@74|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (forall b: Int :: { Triggersg$(this$_6, b) } true ==> Triggersg$(this$_6, b))
(declare-const b@8@01 Int)
(push) ; 3
; [eval] true ==> Triggersg$(this$_6, b)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | True]
; [eval] Triggersg$(this$_6, b)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@9@01))
(assert (and
  (< $k@9@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@9@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@9@01))
(assert (< $k@9@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@9@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@8@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60-aux|)))
(assert (forall ((b@8@01 Int)) (!
  (Triggersg$ ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@7@01)) this$_6@2@01 b@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$: Ref
(declare-const n$@10@01 $Ref)
; [eval] (forall b: Int :: { Triggersg$(this$_6, b) } true ==> Triggersg$(this$_6, b))
(declare-const b@11@01 Int)
(push) ; 3
; [eval] true ==> Triggersg$(this$_6, b)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | True]
; [eval] Triggersg$(this$_6, b)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and
  (< $k@12@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@12@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@12@01))
(assert (and
  (< $k@12@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@12@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@12@01))
(assert (< $k@12@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@12@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@11@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60-aux|)))
(assert (forall ((b@11@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((b@11@01 Int)) (!
  (=>
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((b@11@01 Int)) (!
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_6@2@01 b@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@94@12@94@60|)))
(pop) ; 2
(pop) ; 1
; ---------- Triggerstriggers_two$ ----------
(declare-const this$_7@13@01 $Ref)
(declare-const k$_1@14@01 $Perm)
(declare-const this$_7@15@01 $Ref)
(declare-const k$_1@16@01 $Perm)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] this$_7 != null
(assert (not (= this$_7@15@01 $Ref.null)))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (= ($Snap.first ($Snap.second $t@17@01)) $Snap.unit))
; [eval] k$_1 > none
(assert (> k$_1@16@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@17@01))) $Snap.unit))
; [eval] write > k$_1
(assert (> $Perm.Write k$_1@16@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@17@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@17@01))))
  $Snap.unit))
; [eval] (forall a: Int, b: Int, c: Int :: { Triggersg$(this$_7, a), Triggersf$(this$_7, a, b, c) } { Triggersf$(this$_7, a, b, c) } true ==> Triggersg$(this$_7, a) && Triggersf$(this$_7, a, b, c))
(declare-const a@18@01 Int)
(declare-const b@19@01 Int)
(declare-const c@20@01 Int)
(push) ; 2
; [eval] true ==> Triggersg$(this$_7, a) && Triggersf$(this$_7, a, b, c)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | True]
; [eval] Triggersg$(this$_7, a) && Triggersf$(this$_7, a, b, c)
; [eval] Triggersg$(this$_7, a)
(push) ; 5
; [eval] this$_4 != null
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@21@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert (and
  (< $k@21@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@21@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@17@01))))), this$_7@15@01, a@18@01)) | live]
; [else-branch: 5 | Triggersg$((_, First:(Second:(Second:(Second:($t@17@01))))), this$_7@15@01, a@18@01) | live]
(push) ; 6
; [then-branch: 5 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@17@01))))), this$_7@15@01, a@18@01))]
(assert (not
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | Triggersg$((_, First:(Second:(Second:(Second:($t@17@01))))), this$_7@15@01, a@18@01)]
(assert (Triggersg$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01))
; [eval] Triggersf$(this$_7, a, b, c)
(push) ; 7
; [eval] this$_2 != null
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@22@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@22@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@22@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@22@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@22@01))
(assert (=>
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
  (and
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (< $k@22@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@22@01))
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))))
(assert (or
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
  (not
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@21@01))
(assert ($Perm.isReadVar $k@22@01))
(assert (and
  (< $k@21@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@21@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
  (=>
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (and
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
      (< $k@22@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@22@01))
      (Triggersf$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01)))
  (or
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (not
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@21@01))
(assert ($Perm.isReadVar $k@22@01))
(assert (< $k@21@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@21@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@18@01 Int) (b@19@01 Int) (c@20@01 Int)) (!
  (and
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (=>
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
      (and
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
        (< $k@22@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@22@01))
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01)))
    (or
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
      (not
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01))))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@105@13@106@68-aux|)))
(assert (forall ((a@18@01 Int) (b@19@01 Int) (c@20@01 Int)) (!
  (and
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (=>
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
      (and
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
        (< $k@22@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@22@01))
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01)))
    (or
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
      (not
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01))))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@105@13@106@68-aux|)))
(assert (forall ((a@18@01 Int) (b@19@01 Int) (c@20@01 Int)) (!
  (and
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 a@18@01 b@19@01 c@20@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@105@13@106@68|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (=
  ($Snap.second $t@23@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@23@01))
    ($Snap.second ($Snap.second $t@23@01)))))
(assert (= ($Snap.first ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_7, x, y, z) } true ==> Triggersf$(this$_7, x, y, z))
(declare-const x@24@01 Int)
(declare-const y@25@01 Int)
(declare-const z@26@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_7, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | True]
; [eval] Triggersf$(this$_7, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(assert (< $k@27@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@27@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@27@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@27@01))
(assert (and
  (< $k@27@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@27@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@27@01))
(assert (and
  (< $k@27@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@27@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@27@01))
(assert (< $k@27@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@27@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@24@01 Int) (y@25@01 Int) (z@26@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82-aux|)))
(assert (forall ((x@24@01 Int) (y@25@01 Int) (z@26@01 Int)) (!
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 x@24@01 y@25@01 z@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82|)))
(assert (= ($Snap.second ($Snap.second $t@23@01)) $Snap.unit))
; [eval] (forall w: Int :: { Triggersg$(this$_7, w) } true ==> Triggersg$(this$_7, w))
(declare-const w@28@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersg$(this$_7, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | True | live]
; [else-branch: 7 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | True]
; [eval] Triggersg$(this$_7, w)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@29@01 $Perm)
(assert ($Perm.isReadVar $k@29@01))
(assert (< $k@29@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@29@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (and
  (< $k@29@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@29@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@29@01))
(assert (and
  (< $k@29@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@29@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@29@01))
(assert (< $k@29@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@29@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@28@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36-aux|)))
(assert (forall ((w@28@01 Int)) (!
  (Triggersg$ ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@23@01)) this$_7@15@01 w@28@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$_1: Ref
(declare-const n$_1@30@01 $Ref)
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_7, x, y, z) } true ==> Triggersf$(this$_7, x, y, z))
(declare-const x@31@01 Int)
(declare-const y@32@01 Int)
(declare-const z@33@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_7, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | True]
; [eval] Triggersf$(this$_7, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
(assert (< $k@34@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@34@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@34@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (and
  (< $k@34@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@34@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@34@01))
(assert (and
  (< $k@34@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@34@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@34@01))
(assert (< $k@34@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@34@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@31@01 Int) (y@32@01 Int) (z@33@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82-aux|)))
(assert (forall ((x@31@01 Int) (y@32@01 Int) (z@33@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@31@01 Int) (y@32@01 Int) (z@33@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@31@01 Int) (y@32@01 Int) (z@33@01 Int)) (!
  (Triggersf$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 x@31@01 y@32@01 z@33@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@108@12@108@82|)))
; [eval] (forall w: Int :: { Triggersg$(this$_7, w) } true ==> Triggersg$(this$_7, w))
(declare-const w@35@01 Int)
(push) ; 3
; [eval] true ==> Triggersg$(this$_7, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | True]
; [eval] Triggersg$(this$_7, w)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@36@01 $Perm)
(assert ($Perm.isReadVar $k@36@01))
(assert (< $k@36@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@36@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@36@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and
  (< $k@36@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@36@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@36@01))
(assert (and
  (< $k@36@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@36@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@36@01))
(assert (< $k@36@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@36@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@35@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36-aux|)))
(assert (forall ((w@35@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((w@35@01 Int)) (!
  (=>
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01)
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@35@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36|))))
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
; [eval] (forall w: Int :: { Triggersg$(this$_7, w) } true ==> Triggersg$(this$_7, w))
(declare-const w@37@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersg$(this$_7, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersg$(this$_7, w)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@38@01 $Perm)
(assert ($Perm.isReadVar $k@38@01))
(assert (< $k@38@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@38@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@38@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (and
  (< $k@38@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@38@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@38@01))
(assert (and
  (< $k@38@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@38@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@38@01))
(assert (< $k@38@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@38@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@37@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36-aux|)))
(assert (forall ((w@37@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((w@37@01 Int)) (!
  (=>
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01)
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36|))))
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
; [eval] (forall w: Int :: { Triggersg$(this$_7, w) } true ==> Triggersg$(this$_7, w))
(declare-const w@39@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersg$(this$_7, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersg$(this$_7, w)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@40@01 $Perm)
(assert ($Perm.isReadVar $k@40@01))
(assert (< $k@40@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@40@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@40@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (and
  (< $k@40@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@40@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@40@01))
(assert (and
  (< $k@40@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@40@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@40@01))
(assert (< $k@40@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@40@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@39@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36-aux|)))
(assert (forall ((w@39@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((w@39@01 Int)) (!
  (=>
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01)
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@39@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36|))))
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
; [eval] (forall w: Int :: { Triggersg$(this$_7, w) } true ==> Triggersg$(this$_7, w))
(declare-const w@41@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersg$(this$_7, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersg$(this$_7, w)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(assert (< $k@42@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@42@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@42@01))
(assert (and
  (< $k@42@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@42@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@42@01))
(assert (and
  (< $k@42@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@42@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@42@01))
(assert (< $k@42@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@42@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@41@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36-aux|)))
(assert (forall ((w@41@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01)
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((w@41@01 Int)) (!
  (=>
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01)
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@17@01))))) this$_7@15@01 w@41@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@110@12@111@36|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Triggerstriggers_three$ ----------
(declare-const this$_8@43@01 $Ref)
(declare-const k$_2@44@01 $Perm)
(declare-const this$_8@45@01 $Ref)
(declare-const k$_2@46@01 $Perm)
(push) ; 1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
(assert (= ($Snap.first $t@47@01) $Snap.unit))
; [eval] this$_8 != null
(assert (not (= this$_8@45@01 $Ref.null)))
(assert (=
  ($Snap.second $t@47@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@47@01))
    ($Snap.second ($Snap.second $t@47@01)))))
(assert (= ($Snap.first ($Snap.second $t@47@01)) $Snap.unit))
; [eval] k$_2 > none
(assert (> k$_2@46@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@47@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@47@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@47@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@47@01))) $Snap.unit))
; [eval] write > k$_2
(assert (> $Perm.Write k$_2@46@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@47@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@47@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@47@01))))
  $Snap.unit))
; [eval] (forall a: Int :: { Triggersg$(this$_8, a) } true ==> Triggersg$(this$_8, a) && (forall b: Int, c: Int :: { Triggersf$(this$_8, a, b, c) } true ==> Triggersf$(this$_8, a, b, c)))
(declare-const a@48@01 Int)
(push) ; 2
; [eval] true ==> Triggersg$(this$_8, a) && (forall b: Int, c: Int :: { Triggersf$(this$_8, a, b, c) } true ==> Triggersf$(this$_8, a, b, c))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | True | live]
; [else-branch: 13 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | True]
; [eval] Triggersg$(this$_8, a) && (forall b: Int, c: Int :: { Triggersf$(this$_8, a, b, c) } true ==> Triggersf$(this$_8, a, b, c))
; [eval] Triggersg$(this$_8, a)
(push) ; 5
; [eval] this$_4 != null
(declare-const $k@49@01 $Perm)
(assert ($Perm.isReadVar $k@49@01))
(assert (< $k@49@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@49@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@49@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@49@01))
(assert (and
  (< $k@49@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@49@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@47@01))))), this$_8@45@01, a@48@01)) | live]
; [else-branch: 14 | Triggersg$((_, First:(Second:(Second:(Second:($t@47@01))))), this$_8@45@01, a@48@01) | live]
(push) ; 6
; [then-branch: 14 | !(Triggersg$((_, First:(Second:(Second:(Second:($t@47@01))))), this$_8@45@01, a@48@01))]
(assert (not
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | Triggersg$((_, First:(Second:(Second:(Second:($t@47@01))))), this$_8@45@01, a@48@01)]
(assert (Triggersg$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))
; [eval] (forall b: Int, c: Int :: { Triggersf$(this$_8, a, b, c) } true ==> Triggersf$(this$_8, a, b, c))
(declare-const b@50@01 Int)
(declare-const c@51@01 Int)
(push) ; 7
; [eval] true ==> Triggersf$(this$_8, a, b, c)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | True | live]
; [else-branch: 15 | False | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 15 | True]
; [eval] Triggersf$(this$_8, a, b, c)
(push) ; 10
; [eval] this$_2 != null
(declare-const $k@52@01 $Perm)
(assert ($Perm.isReadVar $k@52@01))
(assert (< $k@52@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@52@01)))
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No $k@52@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
(pop) ; 10
; Joined path conditions
(assert ($Perm.isReadVar $k@52@01))
(assert (and
  (< $k@52@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@52@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@52@01))
(assert (and
  (< $k@52@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@52@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@52@01))
(assert (< $k@52@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@52@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((b@50@01 Int) (c@51@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@124@16@124@78-aux|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@52@01))
(assert (=>
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
  (and
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
    (< $k@52@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@52@01))
    (forall ((b@50@01 Int) (c@51@01 Int)) (!
      (Triggersf$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)
      :pattern ((Triggersf$%limited ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@124@16@124@78-aux|)))))
(assert (or
  (Triggersg$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
  (not
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@49@01))
(assert ($Perm.isReadVar $k@52@01))
(assert (and
  (< $k@49@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@49@01))
  (Triggersg$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
  (=>
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
    (and
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
      (< $k@52@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@52@01))
      (forall ((b@50@01 Int) (c@51@01 Int)) (!
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)
        :pattern ((Triggersf$%limited ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
        :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@124@16@124@78-aux|))))
  (or
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
    (not
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@49@01))
(assert ($Perm.isReadVar $k@52@01))
(assert (< $k@49@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@49@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@48@01 Int)) (!
  (and
    (Triggersg$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
    (=>
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
      (and
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
        (< $k@52@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@52@01))
        (forall ((b@50@01 Int) (c@51@01 Int)) (!
          (Triggersf$%precondition ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)
          :pattern ((Triggersf$%limited ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@124@16@124@78-aux|))))
    (or
      (Triggersg$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
      (not
        (Triggersg$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@122@12@124@79-aux|)))
(assert (forall ((a@48@01 Int)) (!
  (and
    (Triggersg$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01)
    (forall ((b@50@01 Int) (c@51@01 Int)) (!
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01)
      :pattern ((Triggersf$%limited ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01 b@50@01 c@51@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@124@16@124@78|)))
  :pattern ((Triggersg$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 a@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@122@12@124@79|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (=
  ($Snap.second $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@53@01))
    ($Snap.second ($Snap.second $t@53@01)))))
(assert (= ($Snap.first ($Snap.second $t@53@01)) $Snap.unit))
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_8, x, y, z) } true ==> Triggersf$(this$_8, x, y, z))
(declare-const x@54@01 Int)
(declare-const y@55@01 Int)
(declare-const z@56@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_8, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | True]
; [eval] Triggersf$(this$_8, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@57@01 $Perm)
(assert ($Perm.isReadVar $k@57@01))
(assert (< $k@57@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@57@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@57@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@57@01))
(assert (and
  (< $k@57@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@57@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@57@01))
(assert (and
  (< $k@57@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@57@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@57@01))
(assert (< $k@57@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@57@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@54@01 Int) (y@55@01 Int) (z@56@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82-aux|)))
(assert (forall ((x@54@01 Int) (y@55@01 Int) (z@56@01 Int)) (!
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 x@54@01 y@55@01 z@56@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82|)))
(assert (= ($Snap.second ($Snap.second $t@53@01)) $Snap.unit))
; [eval] (forall w: Int :: { Triggersg$(this$_8, w) } true ==> Triggersg$(this$_8, w))
(declare-const w@58@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersg$(this$_8, w)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | True]
; [eval] Triggersg$(this$_8, w)
(push) ; 6
; [eval] this$_4 != null
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(assert (< $k@59@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@59@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (and
  (< $k@59@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@59@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@59@01))
(assert (and
  (< $k@59@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@59@01))
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@59@01))
(assert (< $k@59@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@59@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((w@58@01 Int)) (!
  (Triggersg$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@128@12@128@60-aux|)))
(assert (forall ((w@58@01 Int)) (!
  (Triggersg$ ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01)
  :pattern ((Triggersg$%limited ($Snap.combine $Snap.unit ($Snap.first $t@53@01)) this$_8@45@01 w@58@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@128@12@128@60|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$_2: Ref
(declare-const n$_2@60@01 $Ref)
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_8, x, y, z) } true ==> Triggersf$(this$_8, x, y, z))
(declare-const x@61@01 Int)
(declare-const y@62@01 Int)
(declare-const z@63@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_8, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | True | live]
; [else-branch: 18 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | True]
; [eval] Triggersf$(this$_8, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@64@01 $Perm)
(assert ($Perm.isReadVar $k@64@01))
(assert (< $k@64@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@64@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@64@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@64@01))
(assert (and
  (< $k@64@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@64@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@64@01))
(assert (and
  (< $k@64@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@64@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@64@01))
(assert (< $k@64@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@64@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@61@01 Int) (y@62@01 Int) (z@63@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82-aux|)))
(assert (forall ((x@61@01 Int) (y@62@01 Int) (z@63@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@61@01 Int) (y@62@01 Int) (z@63@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@61@01 y@62@01 z@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_8, x, y, z) } true ==> Triggersf$(this$_8, x, y, z))
(declare-const x@65@01 Int)
(declare-const y@66@01 Int)
(declare-const z@67@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_8, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | True | live]
; [else-branch: 19 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_8, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@68@01 $Perm)
(assert ($Perm.isReadVar $k@68@01))
(assert (< $k@68@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@68@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@68@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@68@01))
(assert (and
  (< $k@68@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@68@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@68@01))
(assert (and
  (< $k@68@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@68@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@68@01))
(assert (< $k@68@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@68@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@65@01 Int) (y@66@01 Int) (z@67@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82-aux|)))
(assert (forall ((x@65@01 Int) (y@66@01 Int) (z@67@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@65@01 Int) (y@66@01 Int) (z@67@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@65@01 y@66@01 z@67@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_8, x, y, z) } true ==> Triggersf$(this$_8, x, y, z))
(declare-const x@69@01 Int)
(declare-const y@70@01 Int)
(declare-const z@71@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_8, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | True | live]
; [else-branch: 20 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_8, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@72@01 $Perm)
(assert ($Perm.isReadVar $k@72@01))
(assert (< $k@72@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@72@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@72@01))
(assert (and
  (< $k@72@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@72@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@72@01))
(assert (and
  (< $k@72@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@72@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@72@01))
(assert (< $k@72@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@72@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@69@01 Int) (y@70@01 Int) (z@71@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82-aux|)))
(assert (forall ((x@69@01 Int) (y@70@01 Int) (z@71@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@69@01 Int) (y@70@01 Int) (z@71@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@69@01 y@70@01 z@71@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_8, x, y, z) } true ==> Triggersf$(this$_8, x, y, z))
(declare-const x@73@01 Int)
(declare-const y@74@01 Int)
(declare-const z@75@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_8, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_8, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@76@01 $Perm)
(assert ($Perm.isReadVar $k@76@01))
(assert (< $k@76@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@76@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@76@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@76@01))
(assert (and
  (< $k@76@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@76@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@76@01))
(assert (and
  (< $k@76@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@76@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@76@01))
(assert (< $k@76@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@76@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@73@01 Int) (y@74@01 Int) (z@75@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82-aux|)))
(assert (forall ((x@73@01 Int) (y@74@01 Int) (z@75@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@73@01 Int) (y@74@01 Int) (z@75@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@47@01))))) this$_8@45@01 x@73@01 y@74@01 z@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@127@12@127@82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Triggerstriggers_four$ ----------
(declare-const this$_9@77@01 $Ref)
(declare-const k$_3@78@01 $Perm)
(declare-const this$_9@79@01 $Ref)
(declare-const k$_3@80@01 $Perm)
(push) ; 1
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.first $t@81@01) $Snap.unit))
; [eval] this$_9 != null
(assert (not (= this$_9@79@01 $Ref.null)))
(assert (=
  ($Snap.second $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@81@01))
    ($Snap.second ($Snap.second $t@81@01)))))
(assert (= ($Snap.first ($Snap.second $t@81@01)) $Snap.unit))
; [eval] k$_3 > none
(assert (> k$_3@80@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@81@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@81@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@81@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@81@01))) $Snap.unit))
; [eval] write > k$_3
(assert (> $Perm.Write k$_3@80@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@81@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@81@01))))
  $Snap.unit))
; [eval] (forall a: Int, b: Int, c: Int, d: Int, e: Int :: { Triggersf$(this$_9, a, b, c), Triggersh$(this$_9, b, c, d), Triggersf$(this$_9, c, d, e) } { Triggersf$(this$_9, a, b, c), Triggersf$(this$_9, c, d, e) } true ==> Triggersf$(this$_9, a, b, c) && (Triggersh$(this$_9, b, c, d) && Triggersf$(this$_9, c, d, e)))
(declare-const a@82@01 Int)
(declare-const b@83@01 Int)
(declare-const c@84@01 Int)
(declare-const d@85@01 Int)
(declare-const e@86@01 Int)
(push) ; 2
; [eval] true ==> Triggersf$(this$_9, a, b, c) && (Triggersh$(this$_9, b, c, d) && Triggersf$(this$_9, c, d, e))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | True]
; [eval] Triggersf$(this$_9, a, b, c) && (Triggersh$(this$_9, b, c, d) && Triggersf$(this$_9, c, d, e))
; [eval] Triggersf$(this$_9, a, b, c)
(push) ; 5
; [eval] this$_2 != null
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(assert (< $k@87@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@87@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@87@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@87@01))
(assert (and
  (< $k@87@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@87@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | !(Triggersf$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, a@82@01, b@83@01, c@84@01)) | live]
; [else-branch: 23 | Triggersf$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, a@82@01, b@83@01, c@84@01) | live]
(push) ; 6
; [then-branch: 23 | !(Triggersf$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, a@82@01, b@83@01, c@84@01))]
(assert (not
  (Triggersf$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | Triggersf$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, a@82@01, b@83@01, c@84@01)]
(assert (Triggersf$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01))
; [eval] Triggersh$(this$_9, b, c, d)
(push) ; 7
; [eval] this$_3 != null
(declare-const $k@88@01 $Perm)
(assert ($Perm.isReadVar $k@88@01))
(assert (< $k@88@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@88@01)))
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@88@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (Triggersh$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01))
(pop) ; 7
; Joined path conditions
(assert ($Perm.isReadVar $k@88@01))
(assert (and
  (< $k@88@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@88@01))
  (Triggersh$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)))
(set-option :timeout 0)
(push) ; 7
; [then-branch: 24 | !(Triggersh$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, b@83@01, c@84@01, d@85@01)) | live]
; [else-branch: 24 | Triggersh$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, b@83@01, c@84@01, d@85@01) | live]
(push) ; 8
; [then-branch: 24 | !(Triggersh$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, b@83@01, c@84@01, d@85@01))]
(assert (not
  (Triggersh$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 24 | Triggersh$((_, First:(Second:(Second:(Second:($t@81@01))))), this$_9@79@01, b@83@01, c@84@01, d@85@01)]
(assert (Triggersh$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01))
; [eval] Triggersf$(this$_9, c, d, e)
(push) ; 9
; [eval] this$_2 != null
(declare-const $k@89@01 $Perm)
(assert ($Perm.isReadVar $k@89@01))
(assert (< $k@89@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@89@01)))
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@89@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))
(pop) ; 9
; Joined path conditions
(assert ($Perm.isReadVar $k@89@01))
(assert (and
  (< $k@89@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@89@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@89@01))
(assert (=>
  (Triggersh$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
  (and
    (Triggersh$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
    (< $k@89@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@89@01))
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))))
(assert (or
  (Triggersh$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
  (not
    (Triggersh$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@88@01))
(assert ($Perm.isReadVar $k@89@01))
(assert (=>
  (Triggersf$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
  (and
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (< $k@88@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@88@01))
    (Triggersh$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
    (=>
      (Triggersh$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
      (and
        (Triggersh$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
        (< $k@89@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@89@01))
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
    (or
      (Triggersh$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
      (not
        (Triggersh$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01))))))
(assert (or
  (Triggersf$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
  (not
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@87@01))
(assert ($Perm.isReadVar $k@88@01))
(assert ($Perm.isReadVar $k@89@01))
(assert (and
  (< $k@87@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@87@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
  (=>
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (and
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
      (< $k@88@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@88@01))
      (Triggersh$%precondition ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
      (=>
        (Triggersh$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
        (and
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
          (< $k@89@01 $Perm.Write)
          (<= $Perm.No (- $Perm.Write $k@89@01))
          (Triggersf$%precondition ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
      (or
        (Triggersh$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
        (not
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)))))
  (or
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (not
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@87@01))
(assert ($Perm.isReadVar $k@88@01))
(assert ($Perm.isReadVar $k@89@01))
(assert (< $k@87@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@87@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@82@01 Int) (b@83@01 Int) (c@84@01 Int) (d@85@01 Int) (e@86@01 Int)) (!
  (and
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (=>
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
      (and
        (Triggersf$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
        (< $k@88@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@88@01))
        (Triggersh$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
        (=>
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
          (and
            (Triggersh$ ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
            (< $k@89@01 $Perm.Write)
            (<= $Perm.No (- $Perm.Write $k@89@01))
            (Triggersf$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
        (or
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
          (not
            (Triggersh$ ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)))))
    (or
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
      (not
        (Triggersf$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01))))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01) (Triggersh$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@139@13@140@116-aux|)))
(assert (forall ((a@82@01 Int) (b@83@01 Int) (c@84@01 Int) (d@85@01 Int) (e@86@01 Int)) (!
  (and
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (=>
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
      (and
        (Triggersf$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
        (< $k@88@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@88@01))
        (Triggersh$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
        (=>
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
          (and
            (Triggersh$ ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
            (< $k@89@01 $Perm.Write)
            (<= $Perm.No (- $Perm.Write $k@89@01))
            (Triggersf$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
        (or
          (Triggersh$ ($Snap.combine
            $Snap.unit
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
          (not
            (Triggersh$ ($Snap.combine
              $Snap.unit
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)))))
    (or
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
      (not
        (Triggersf$ ($Snap.combine
          $Snap.unit
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01))))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@139@13@140@116-aux|)))
(assert (forall ((a@82@01 Int) (b@83@01 Int) (c@84@01 Int) (d@85@01 Int) (e@86@01 Int)) (!
  (and
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01)
    (and
      (Triggersh$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01)
      (Triggersf$ ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01)))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01) (Triggersh$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 b@83@01 c@84@01 d@85@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 a@82@01 b@83@01 c@84@01) (Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 c@84@01 d@85@01 e@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@139@13@140@116|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 ($Snap.combine ($Snap.first $t@90@01) ($Snap.second $t@90@01))))
(assert (=
  ($Snap.second $t@90@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@90@01))
    ($Snap.second ($Snap.second $t@90@01)))))
(assert (= ($Snap.first ($Snap.second $t@90@01)) $Snap.unit))
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } true ==> Triggersf$(this$_9, x, y, z))
(declare-const x@91@01 Int)
(declare-const y@92@01 Int)
(declare-const z@93@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | True]
; [eval] Triggersf$(this$_9, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@94@01 $Perm)
(assert ($Perm.isReadVar $k@94@01))
(assert (< $k@94@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@94@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@94@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert (and
  (< $k@94@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@94@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@94@01))
(assert (and
  (< $k@94@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@94@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@94@01))
(assert (< $k@94@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@94@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@91@01 Int) (y@92@01 Int) (z@93@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82-aux|)))
(assert (forall ((x@91@01 Int) (y@92@01 Int) (z@93@01 Int)) (!
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01)
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@91@01 y@92@01 z@93@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82|)))
(assert (= ($Snap.second ($Snap.second $t@90@01)) $Snap.unit))
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } { Triggersf$(this$_9, z, y, x) } true ==> Triggersf$(this$_9, x, y, z) && Triggersf$(this$_9, z, y, x))
(declare-const x@95@01 Int)
(declare-const y@96@01 Int)
(declare-const z@97@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z) && Triggersf$(this$_9, z, y, x)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 26 | True]
; [eval] Triggersf$(this$_9, x, y, z) && Triggersf$(this$_9, z, y, x)
; [eval] Triggersf$(this$_9, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@98@01 $Perm)
(assert ($Perm.isReadVar $k@98@01))
(assert (< $k@98@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@98@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@98@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@98@01))
(assert (and
  (< $k@98@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@98@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)))
(set-option :timeout 0)
(push) ; 6
; [then-branch: 27 | !(Triggersf$((_, First:($t@90@01)), this$_9@79@01, x@95@01, y@96@01, z@97@01)) | live]
; [else-branch: 27 | Triggersf$((_, First:($t@90@01)), this$_9@79@01, x@95@01, y@96@01, z@97@01) | live]
(push) ; 7
; [then-branch: 27 | !(Triggersf$((_, First:($t@90@01)), this$_9@79@01, x@95@01, y@96@01, z@97@01))]
(assert (not
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | Triggersf$((_, First:($t@90@01)), this$_9@79@01, x@95@01, y@96@01, z@97@01)]
(assert (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))
; [eval] Triggersf$(this$_9, z, y, x)
(push) ; 8
; [eval] this$_2 != null
(declare-const $k@99@01 $Perm)
(assert ($Perm.isReadVar $k@99@01))
(assert (< $k@99@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@99@01)))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@99@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@99@01))
(assert (and
  (< $k@99@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@99@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@99@01))
(assert (=>
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
  (and
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (< $k@99@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@99@01))
    (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01))))
(assert (or
  (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
  (not
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@98@01))
(assert ($Perm.isReadVar $k@99@01))
(assert (and
  (< $k@98@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@98@01))
  (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
  (=>
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (and
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
      (< $k@99@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@99@01))
      (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01)))
  (or
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (not
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@98@01))
(assert ($Perm.isReadVar $k@99@01))
(assert (< $k@98@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@98@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@95@01 Int) (y@96@01 Int) (z@97@01 Int)) (!
  (and
    (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (=>
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
      (and
        (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
        (< $k@99@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@99@01))
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01)))
    (or
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
      (not
        (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))))
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@144@12@144@114-aux|)))
(assert (forall ((x@95@01 Int) (y@96@01 Int) (z@97@01 Int)) (!
  (and
    (Triggersf$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (=>
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
      (and
        (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
        (< $k@99@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@99@01))
        (Triggersf$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01)))
    (or
      (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
      (not
        (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))))
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@144@12@144@114-aux|)))
(assert (forall ((x@95@01 Int) (y@96@01 Int) (z@97@01 Int)) (!
  (and
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01)
    (Triggersf$ ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01))
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 x@95@01 y@96@01 z@97@01))
  :pattern ((Triggersf$%limited ($Snap.combine $Snap.unit ($Snap.first $t@90@01)) this$_9@79@01 z@97@01 y@96@01 x@95@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@144@12@144@114|)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$_3: Ref
(declare-const n$_3@100@01 $Ref)
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } true ==> Triggersf$(this$_9, x, y, z))
(declare-const x@101@01 Int)
(declare-const y@102@01 Int)
(declare-const z@103@01 Int)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | True | live]
; [else-branch: 28 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 28 | True]
; [eval] Triggersf$(this$_9, x, y, z)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@104@01 $Perm)
(assert ($Perm.isReadVar $k@104@01))
(assert (< $k@104@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@104@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@104@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@104@01))
(assert (and
  (< $k@104@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@104@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@104@01))
(assert (and
  (< $k@104@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@104@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@104@01))
(assert (< $k@104@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@104@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@101@01 Int) (y@102@01 Int) (z@103@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82-aux|)))
(assert (forall ((x@101@01 Int) (y@102@01 Int) (z@103@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@101@01 Int) (y@102@01 Int) (z@103@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@101@01 y@102@01 z@103@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } true ==> Triggersf$(this$_9, x, y, z))
(declare-const x@105@01 Int)
(declare-const y@106@01 Int)
(declare-const z@107@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | True | live]
; [else-branch: 29 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_9, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@108@01 $Perm)
(assert ($Perm.isReadVar $k@108@01))
(assert (< $k@108@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@108@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@108@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@108@01))
(assert (and
  (< $k@108@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@108@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@108@01))
(assert (and
  (< $k@108@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@108@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@108@01))
(assert (< $k@108@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@108@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@105@01 Int) (y@106@01 Int) (z@107@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82-aux|)))
(assert (forall ((x@105@01 Int) (y@106@01 Int) (z@107@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@105@01 Int) (y@106@01 Int) (z@107@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@105@01 y@106@01 z@107@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } true ==> Triggersf$(this$_9, x, y, z))
(declare-const x@109@01 Int)
(declare-const y@110@01 Int)
(declare-const z@111@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | True | live]
; [else-branch: 30 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_9, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@112@01 $Perm)
(assert ($Perm.isReadVar $k@112@01))
(assert (< $k@112@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@112@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@112@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@112@01))
(assert (and
  (< $k@112@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@112@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@112@01))
(assert (and
  (< $k@112@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@112@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@112@01))
(assert (< $k@112@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@112@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@109@01 Int) (y@110@01 Int) (z@111@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82-aux|)))
(assert (forall ((x@109@01 Int) (y@110@01 Int) (z@111@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@109@01 Int) (y@110@01 Int) (z@111@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@109@01 y@110@01 z@111@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82|))))
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
; [eval] (forall x: Int, y: Int, z: Int :: { Triggersf$(this$_9, x, y, z) } true ==> Triggersf$(this$_9, x, y, z))
(declare-const x@113@01 Int)
(declare-const y@114@01 Int)
(declare-const z@115@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] true ==> Triggersf$(this$_9, x, y, z)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | True | live]
; [else-branch: 31 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] Triggersf$(this$_9, x, y, z)
(set-option :timeout 0)
(push) ; 6
; [eval] this$_2 != null
(declare-const $k@116@01 $Perm)
(assert ($Perm.isReadVar $k@116@01))
(assert (< $k@116@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@116@01)))
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@116@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Triggersf$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@116@01))
(assert (and
  (< $k@116@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@116@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@116@01))
(assert (and
  (< $k@116@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@116@01))
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@116@01))
(assert (< $k@116@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@116@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@113@01 Int) (y@114@01 Int) (z@115@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82-aux|)))
(assert (forall ((x@113@01 Int) (y@114@01 Int) (z@115@01 Int)) (!
  (Triggersf$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01)
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x@113@01 Int) (y@114@01 Int) (z@115@01 Int)) (!
  (=>
    (Triggersf$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01)
    (Triggersf$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01))
  :pattern ((Triggersf$%limited ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@81@01))))) this$_9@79@01 x@113@01 y@114@01 z@115@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@143@12@143@82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Triggerstriggers_five$ ----------
(declare-const this$_10@117@01 $Ref)
(declare-const k$_4@118@01 $Perm)
(declare-const c@119@01 Bool)
(declare-const d@120@01 Bool)
(declare-const this$_10@121@01 $Ref)
(declare-const k$_4@122@01 $Perm)
(declare-const c@123@01 Bool)
(declare-const d@124@01 Bool)
(push) ; 1
(declare-const $t@125@01 $Snap)
(assert (= $t@125@01 ($Snap.combine ($Snap.first $t@125@01) ($Snap.second $t@125@01))))
(assert (= ($Snap.first $t@125@01) $Snap.unit))
; [eval] this$_10 != null
(assert (not (= this$_10@121@01 $Ref.null)))
(assert (=
  ($Snap.second $t@125@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@125@01))
    ($Snap.second ($Snap.second $t@125@01)))))
(assert (= ($Snap.first ($Snap.second $t@125@01)) $Snap.unit))
; [eval] k$_4 > none
(assert (> k$_4@122@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@125@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@125@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@125@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@125@01))) $Snap.unit))
; [eval] write > k$_4
(assert (> $Perm.Write k$_4@122@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@125@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@125@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@125@01))))
  $Snap.unit))
; [eval] c ==> d
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not c@123@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not c@123@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | c@123@01 | live]
; [else-branch: 32 | !(c@123@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 32 | c@123@01]
(assert c@123@01)
(pop) ; 3
(push) ; 3
; [else-branch: 32 | !(c@123@01)]
(assert (not c@123@01))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not c@123@01) c@123@01))
(assert (=> c@123@01 d@124@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))
  $Snap.unit))
; [eval] (forall x: Int, fresh__0: Bool :: { Triggersi$(this$_10, x, fresh__0) } true ==> Triggersi$(this$_10, x, c ==> d))
(declare-const x@126@01 Int)
(declare-const fresh__0@127@01 Bool)
(push) ; 2
; [eval] true ==> Triggersi$(this$_10, x, c ==> d)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 33 | True]
; [eval] Triggersi$(this$_10, x, c ==> d)
; [eval] c ==> d
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not c@123@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not c@123@01))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | c@123@01 | live]
; [else-branch: 34 | !(c@123@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 34 | c@123@01]
(assert c@123@01)
(pop) ; 6
(push) ; 6
; [else-branch: 34 | !(c@123@01)]
(assert (not c@123@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
; [eval] this$_5 != null
(declare-const $k@128@01 $Perm)
(assert ($Perm.isReadVar $k@128@01))
(assert (< $k@128@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@128@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@128@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 (=>
  c@123@01
  d@124@01)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@128@01))
(assert (and
  (< $k@128@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@128@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 (=>
    c@123@01
    d@124@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@128@01))
(assert (and
  (< $k@128@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@128@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 (=>
    c@123@01
    d@124@01))))
; [eval] Triggersi$(this$_10, x, fresh__0)
(set-option :timeout 0)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@129@01 $Perm)
(assert ($Perm.isReadVar $k@129@01))
(assert (< $k@129@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@129@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@129@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@129@01))
(assert (and
  (< $k@129@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@129@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01)))
(assert ($Perm.isReadVar $k@129@01))
(assert (< $k@129@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@129@01)))
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@128@01))
(assert ($Perm.isReadVar $k@129@01))
(assert (< $k@128@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@128@01)))
(assert (< $k@129@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@129@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@126@01 Int) (fresh__0@127@01 Bool)) (!
  (and
    (Triggersi$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 (=>
      c@123@01
      d@124@01))
    (Triggersi$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01))
  :pattern ((Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@156@13@156@71-aux|)))
(assert (forall ((x@126@01 Int) (fresh__0@127@01 Bool)) (!
  (Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 (=>
    c@123@01
    d@124@01))
  :pattern ((Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 x@126@01 fresh__0@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@156@13@156@71|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 ($Snap.combine ($Snap.first $t@130@01) ($Snap.second $t@130@01))))
(assert (= ($Snap.second $t@130@01) $Snap.unit))
; [eval] Triggersi$(this$_10, 4, true)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@131@01 $Perm)
(assert ($Perm.isReadVar $k@131@01))
(assert (< $k@131@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@131@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@131@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@130@01)) this$_10@121@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@131@01))
(assert (and
  (< $k@131@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@131@01))
  (Triggersi$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@130@01)) this$_10@121@01 4 true)))
(assert (Triggersi$ ($Snap.combine $Snap.unit ($Snap.first $t@130@01)) this$_10@121@01 4 true))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$_4: Ref
(declare-const n$_4@132@01 $Ref)
; [eval] Triggersi$(this$_10, 4, true)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@133@01 $Perm)
(assert ($Perm.isReadVar $k@133@01))
(assert (< $k@133@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@133@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@133@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@133@01))
(assert (and
  (< $k@133@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@133@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 4 true)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Triggersi$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 4 true)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@125@01)))))) this$_10@121@01 4 true))
(pop) ; 2
(pop) ; 1
; ---------- Triggerstriggers_six$ ----------
(declare-const this$_11@134@01 $Ref)
(declare-const k$_5@135@01 $Perm)
(declare-const c@136@01 Int)
(declare-const d@137@01 Int)
(declare-const this$_11@138@01 $Ref)
(declare-const k$_5@139@01 $Perm)
(declare-const c@140@01 Int)
(declare-const d@141@01 Int)
(push) ; 1
(declare-const $t@142@01 $Snap)
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(assert (= ($Snap.first $t@142@01) $Snap.unit))
; [eval] this$_11 != null
(assert (not (= this$_11@138@01 $Ref.null)))
(assert (=
  ($Snap.second $t@142@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@142@01))
    ($Snap.second ($Snap.second $t@142@01)))))
(assert (= ($Snap.first ($Snap.second $t@142@01)) $Snap.unit))
; [eval] k$_5 > none
(assert (> k$_5@139@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@142@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@142@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@142@01))) $Snap.unit))
; [eval] write > k$_5
(assert (> $Perm.Write k$_5@139@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@142@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  $Snap.unit))
; [eval] c > d
(assert (> c@140@01 d@141@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))
  $Snap.unit))
; [eval] (forall x: Int, fresh__1: Bool :: { Triggersi$(this$_11, x, fresh__1) } true ==> Triggersi$(this$_11, x, c > d))
(declare-const x@143@01 Int)
(declare-const fresh__1@144@01 Bool)
(push) ; 2
; [eval] true ==> Triggersi$(this$_11, x, c > d)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 35 | True]
; [eval] Triggersi$(this$_11, x, c > d)
; [eval] c > d
(push) ; 5
; [eval] this$_5 != null
(declare-const $k@145@01 $Perm)
(assert ($Perm.isReadVar $k@145@01))
(assert (< $k@145@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@145@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@145@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 (>
  c@140@01
  d@141@01)))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@145@01))
(assert (and
  (< $k@145@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@145@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 (>
    c@140@01
    d@141@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@145@01))
(assert (and
  (< $k@145@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@145@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 (>
    c@140@01
    d@141@01))))
; [eval] Triggersi$(this$_11, x, fresh__1)
(set-option :timeout 0)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@146@01 $Perm)
(assert ($Perm.isReadVar $k@146@01))
(assert (< $k@146@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@146@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@146@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@146@01))
(assert (and
  (< $k@146@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@146@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01)))
(assert ($Perm.isReadVar $k@146@01))
(assert (< $k@146@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@146@01)))
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@145@01))
(assert ($Perm.isReadVar $k@146@01))
(assert (< $k@145@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@145@01)))
(assert (< $k@146@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@146@01)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@143@01 Int) (fresh__1@144@01 Bool)) (!
  (and
    (Triggersi$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 (>
      c@140@01
      d@141@01))
    (Triggersi$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01))
  :pattern ((Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@170@13@170@69-aux|)))
(assert (forall ((x@143@01 Int) (fresh__1@144@01 Bool)) (!
  (Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 (>
    c@140@01
    d@141@01))
  :pattern ((Triggersi$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 x@143@01 fresh__1@144@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0005b.vpr@170@13@170@69|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@147@01 $Snap)
(assert (= $t@147@01 ($Snap.combine ($Snap.first $t@147@01) ($Snap.second $t@147@01))))
(assert (= ($Snap.second $t@147@01) $Snap.unit))
; [eval] Triggersi$(this$_11, 4, true)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@148@01 $Perm)
(assert ($Perm.isReadVar $k@148@01))
(assert (< $k@148@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@148@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@148@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@147@01)) this$_11@138@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@148@01))
(assert (and
  (< $k@148@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@148@01))
  (Triggersi$%precondition ($Snap.combine $Snap.unit ($Snap.first $t@147@01)) this$_11@138@01 4 true)))
(assert (Triggersi$ ($Snap.combine $Snap.unit ($Snap.first $t@147@01)) this$_11@138@01 4 true))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$_5: Ref
(declare-const n$_5@149@01 $Ref)
; [eval] Triggersi$(this$_11, 4, true)
(push) ; 3
; [eval] this$_5 != null
(declare-const $k@150@01 $Perm)
(assert ($Perm.isReadVar $k@150@01))
(assert (< $k@150@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@150@01)))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@150@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 4 true))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@150@01))
(assert (and
  (< $k@150@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@150@01))
  (Triggersi$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 4 true)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Triggersi$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 4 true)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Triggersi$ ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@142@01)))))) this$_11@138@01 4 true))
(pop) ; 2
(pop) ; 1
