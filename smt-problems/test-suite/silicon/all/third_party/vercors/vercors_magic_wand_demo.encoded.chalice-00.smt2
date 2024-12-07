(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/vercors/vercors_magic_wand_demo.encoded.chalice.vpr
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
(declare-fun Wand_readonly_for_writeonlyget_out_1$ ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonlyget_out_1$%limited ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonlyget_out_1$%stateless ($Ref) Bool)
(declare-fun Wand_readonly_for_writeonlyget_out_1$%precondition ($Snap $Ref) Bool)
(declare-fun Wand_readonly_for_writeonlyget_in_1$ ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonlyget_in_1$%limited ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonlyget_in_1$%stateless ($Ref) Bool)
(declare-fun Wand_readonly_for_writeonlyget_in_1$%precondition ($Snap $Ref) Bool)
(declare-fun WandDemoget$ ($Snap $Ref) Int)
(declare-fun WandDemoget$%limited ($Snap $Ref) Int)
(declare-fun WandDemoget$%stateless ($Ref) Bool)
(declare-fun WandDemoget$%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Wand_readonly_for_writeonly$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap $Ref) Bool)
(declare-fun WandDemo$MonitorInvariant%trigger ($Snap $Ref) Bool)
(declare-fun WandDemoreadonly$%trigger ($Snap $Ref) Bool)
(declare-fun WandDemowriteonly$%trigger ($Snap $Ref) Bool)
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
(declare-fun $k@6@00 () $Perm)
(declare-fun joined_unfolding@13@00 ($Snap $Ref) $Ref)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun $k@12@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(declare-fun joined_unfolding@21@00 ($Snap $Ref) $Ref)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun $k@20@00 () $Perm)
(declare-fun $k@22@00 () $Perm)
(declare-fun $k@23@00 () $Perm)
(declare-fun $k@24@00 () $Perm)
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref)) (!
  (=
    (Wand_readonly_for_writeonlyget_out_1$%limited s@$ this$_2@0@00)
    (Wand_readonly_for_writeonlyget_out_1$ s@$ this$_2@0@00))
  :pattern ((Wand_readonly_for_writeonlyget_out_1$ s@$ this$_2@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref)) (!
  (Wand_readonly_for_writeonlyget_out_1$%stateless this$_2@0@00)
  :pattern ((Wand_readonly_for_writeonlyget_out_1$%limited s@$ this$_2@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@11@00)
    ($Perm.isReadVar $k@12@00)
    (=>
      (Wand_readonly_for_writeonlyget_out_1$%precondition s@$ this$_2@0@00)
      (=
        (Wand_readonly_for_writeonlyget_out_1$ s@$ this$_2@0@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((Wand_readonly_for_writeonlyget_out_1$ s@$ this$_2@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this$_2@0@00 $Ref)) (!
  true
  :pattern ((Wand_readonly_for_writeonlyget_out_1$ s@$ this$_2@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (this$_1@2@00 $Ref)) (!
  (=
    (Wand_readonly_for_writeonlyget_in_1$%limited s@$ this$_1@2@00)
    (Wand_readonly_for_writeonlyget_in_1$ s@$ this$_1@2@00))
  :pattern ((Wand_readonly_for_writeonlyget_in_1$ s@$ this$_1@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this$_1@2@00 $Ref)) (!
  (Wand_readonly_for_writeonlyget_in_1$%stateless this$_1@2@00)
  :pattern ((Wand_readonly_for_writeonlyget_in_1$%limited s@$ this$_1@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this$_1@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    (=>
      (Wand_readonly_for_writeonlyget_in_1$%precondition s@$ this$_1@2@00)
      (=
        (Wand_readonly_for_writeonlyget_in_1$ s@$ this$_1@2@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  :pattern ((Wand_readonly_for_writeonlyget_in_1$ s@$ this$_1@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this$_1@2@00 $Ref)) (!
  true
  :pattern ((Wand_readonly_for_writeonlyget_in_1$ s@$ this$_1@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  (= (WandDemoget$%limited s@$ this$_9@4@00) (WandDemoget$ s@$ this$_9@4@00))
  :pattern ((WandDemoget$ s@$ this$_9@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  (WandDemoget$%stateless this$_9@4@00)
  :pattern ((WandDemoget$%limited s@$ this$_9@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    (=>
      (WandDemoget$%precondition s@$ this$_9@4@00)
      (=
        (WandDemoget$ s@$ this$_9@4@00)
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((WandDemoget$ s@$ this$_9@4@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  true
  :pattern ((WandDemoget$ s@$ this$_9@4@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Wand_readonly_for_writeonlyapply$ ----------
(declare-const this$_3@0@01 $Ref)
(declare-const k$@1@01 $Perm)
(declare-const this$_3@2@01 $Ref)
(declare-const k$@3@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] this$_3 != null
(assert (not (= this$_3@2@01 $Ref.null)))
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
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonlyget_in_1$(this$_3) != null
; [eval] Wand_readonly_for_writeonlyget_in_1$(this$_3)
(push) ; 2
; [eval] this$_1 != null
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (< $k@5@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@5@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Wand_readonly_for_writeonlyget_in_1$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (and
  (< $k@5@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@5@01))
  (Wand_readonly_for_writeonlyget_in_1$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01)))
(assert (not
  (=
    (Wand_readonly_for_writeonlyget_in_1$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01)
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
; [eval] Wand_readonly_for_writeonlyget_in_1$(this$_3)
(set-option :timeout 0)
(push) ; 2
; [eval] this$_1 != null
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert (and (< $k@6@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@6@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonlyget_out_1$(this$_3) != null
; [eval] Wand_readonly_for_writeonlyget_out_1$(this$_3)
(set-option :timeout 0)
(push) ; 2
; [eval] this$_2 != null
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Wand_readonly_for_writeonlyget_out_1$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (Wand_readonly_for_writeonlyget_out_1$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01)))
(assert (not
  (=
    (Wand_readonly_for_writeonlyget_out_1$ ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01)
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] old(Wand_readonly_for_writeonlyget_out_1$(this$_3))
; [eval] Wand_readonly_for_writeonlyget_out_1$(this$_3)
(push) ; 3
; [eval] this$_2 != null
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
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@8@01))
(assert (and (< $k@8@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@8@01))))
(declare-const $t@9@01 Int)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var n$: Ref
(declare-const n$@10@01 $Ref)
; [exec]
; unfold acc(Wand_readonly_for_writeonlyvalid_wand$(this$_3), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (<= $Perm.No $k@11@01))
(assert (<= $k@11@01 $Perm.Write))
(assert (=> (< $Perm.No $k@11@01) (not (= this$_3@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  $Snap.unit))
; [eval] 1 <= this$_4.Wand_readonly_for_writeonlylemma$
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  1
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (<= $Perm.No $k@12@01))
(assert (<= $k@12@01 $Perm.Write))
(assert (=> (< $Perm.No $k@12@01) (not (= this$_3@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (<= $Perm.No $k@13@01))
(assert (<= $k@13@01 $Perm.Write))
(assert (=> (< $Perm.No $k@13@01) (not (= this$_3@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(assert (<= $Perm.No $k@14@01))
(assert (<= $k@14@01 $Perm.Write))
(assert (=> (< $Perm.No $k@14@01) (not (= this$_3@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1 | live]
; [else-branch: 0 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlythis_1$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyin_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyout_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_3@2@01))
; [eval] this$_3.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1 | live]
; [else-branch: 1 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1]
; [exec]
; unfold acc(WandDemoreadonly$(this$_3.Wand_readonly_for_writeonlythis_1$), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (Wand_readonly_for_writeonlyget_in_1$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (WandDemoreadonly$%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
; [exec]
; fold acc(WandDemowriteonly$(this$_3.Wand_readonly_for_writeonlythis_1$), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (WandDemowriteonly$%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))))
; [eval] old(Wand_readonly_for_writeonlyget_out_1$(this$_3))
; [eval] Wand_readonly_for_writeonlyget_out_1$(this$_3)
(set-option :timeout 0)
(push) ; 5
; [eval] this$_2 != null
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (< $k@15@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@15@01)))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@15@01))
(assert (and (< $k@15@01 $Perm.Write) (<= $Perm.No (- $Perm.Write $k@15@01))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
  (Wand_readonly_for_writeonlyget_out_1$ ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) this$_3@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] !(this$_3.Wand_readonly_for_writeonlylemma$ == 1)
; [eval] this$_3.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1 | dead]
; [else-branch: 2 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
    1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unsat
(assert (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) this$_3@2@01))
; [eval] this$_3.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1 | dead]
; [else-branch: 3 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1]
(pop) ; 4
; [eval] !(this$_3.Wand_readonly_for_writeonlylemma$ == 1)
; [eval] this$_3.Wand_readonly_for_writeonlylemma$ == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:(Second:(Second:(Second:($t@4@01))))) != 1 | dead]
; [else-branch: 4 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:(First:(Second:(Second:(Second:($t@4@01))))) == 1]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
  1))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Wand_readonly_for_writeonlyWand_readonly_for_writeonly_init$ ----------
(declare-const this$_5@16@01 $Ref)
(declare-const k$_1@17@01 $Perm)
(declare-const this$_5@18@01 $Ref)
(declare-const k$_1@19@01 $Perm)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(assert (= ($Snap.first $t@20@01) $Snap.unit))
; [eval] this$_5 != null
(assert (not (= this$_5@18@01 $Ref.null)))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(assert (= ($Snap.first ($Snap.second $t@20@01)) $Snap.unit))
; [eval] k$_1 > none
(assert (> k$_1@19@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@20@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@20@01))) $Snap.unit))
; [eval] write > k$_1
(assert (> $Perm.Write k$_1@19@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@01)))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(assert (= ($Snap.first ($Snap.second $t@21@01)) $Snap.unit))
; [eval] this$_5.Wand_readonly_for_writeonlylemma$ == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@21@01)) 0))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] this$_5.Wand_readonly_for_writeonlyin_1$ == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@21@01))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  $Snap.unit))
; [eval] this$_5.Wand_readonly_for_writeonlyout_1$ == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  $Snap.unit))
; [eval] this$_5.Wand_readonly_for_writeonlythis_1$ == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Ref.null))
(pop) ; 2
(push) ; 2
; [exec]
; var n$_1: Ref
(declare-const n$_1@22@01 $Ref)
; [exec]
; this$_5.Wand_readonly_for_writeonlylemma$ := 0
; [exec]
; this$_5.Wand_readonly_for_writeonlyin_1$ := null
; [exec]
; this$_5.Wand_readonly_for_writeonlyout_1$ := null
; [exec]
; this$_5.Wand_readonly_for_writeonlythis_1$ := null
; [eval] this$_5.Wand_readonly_for_writeonlylemma$ == 0
; [eval] this$_5.Wand_readonly_for_writeonlyin_1$ == null
; [eval] this$_5.Wand_readonly_for_writeonlyout_1$ == null
; [eval] this$_5.Wand_readonly_for_writeonlythis_1$ == null
(pop) ; 2
(pop) ; 1
; ---------- WandDemoWandDemo_init$ ----------
(declare-const this$_10@23@01 $Ref)
(declare-const k$_2@24@01 $Perm)
(declare-const this$_10@25@01 $Ref)
(declare-const k$_2@26@01 $Perm)
(push) ; 1
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (= ($Snap.first $t@27@01) $Snap.unit))
; [eval] this$_10 != null
(assert (not (= this$_10@25@01 $Ref.null)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
; [eval] k$_2 > none
(assert (> k$_2@26@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
; [eval] write > k$_2
(assert (> $Perm.Write k$_2@26@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@28@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var n$_2: Ref
(declare-const n$_2@29@01 $Ref)
; [exec]
; fold acc(WandDemowriteonly$(this$_10), write)
(assert (WandDemowriteonly$%trigger ($Snap.second ($Snap.second ($Snap.second $t@27@01))) this$_10@25@01))
(pop) ; 2
(pop) ; 1
