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
; ---------- FUNCTION Wand_readonly_for_writeonlyget_out_1$----------
(declare-fun this$_2@0@00 () $Ref)
(declare-fun result@1@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_2 != null
(assert (not (= this$_2@0@00 $Ref.null)))
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(assert (<= $Perm.No $k@6@00))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@6@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_2@0@00 $Ref.null)))
(assert (<= $Perm.No $k@6@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Wand_readonly_for_writeonlyvalid_wand$(this$_2), wildcard) in this$_2.Wand_readonly_for_writeonlyout_1$)
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@6@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@8@00 $k@6@00))
(assert (<= $Perm.No (- $k@6@00 $k@8@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_2@0@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(assert (<= $Perm.No (* $k@9@00 $k@7@00)))
(assert (<= (* $k@9@00 $k@7@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@9@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 1 <= this$_4.Wand_readonly_for_writeonlylemma$
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(assert (<= $Perm.No (* $k@10@00 $k@7@00)))
(assert (<= (* $k@10@00 $k@7@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@10@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(declare-const $k@11@00 $Perm)
(assert ($Perm.isReadVar $k@11@00))
(assert (<= $Perm.No (* $k@11@00 $k@7@00)))
(assert (<= (* $k@11@00 $k@7@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@11@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(declare-const $k@12@00 $Perm)
(assert ($Perm.isReadVar $k@12@00))
(assert (<= $Perm.No (* $k@12@00 $k@7@00)))
(assert (<= (* $k@12@00 $k@7@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@12@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(s@$)) == 1 | live]
; [else-branch: 0 | First:(Second:(s@$)) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(s@$)) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlythis_1$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@12@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@12@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* (/ (to_real 3) (to_real 4)) $k@7@00)))
(assert (<= (* (/ (to_real 3) (to_real 4)) $k@7@00) $Perm.Write))
(assert (=>
  (< $Perm.No (* (/ (to_real 3) (to_real 4)) $k@7@00))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyin_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@10@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@12@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyout_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@11@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@12@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@11@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | First:(Second:(s@$)) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@9@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@11@00 $k@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@13@00 ($Snap $Ref) $Ref)
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
  (=
    (joined_unfolding@13@00 s@$ this$_2@0@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (=
    (joined_unfolding@13@00 s@$ this$_2@0@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert ($Perm.isReadVar $k@9@00))
(assert ($Perm.isReadVar $k@10@00))
(assert ($Perm.isReadVar $k@11@00))
(assert ($Perm.isReadVar $k@12@00))
(assert (and
  (< $k@8@00 $k@6@00)
  (<= $Perm.No (- $k@6@00 $k@8@00))
  (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_2@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No (* $k@9@00 $k@7@00))
  (<= (* $k@9@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@9@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (<= $Perm.No (* $k@10@00 $k@7@00))
  (<= (* $k@10@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@10@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (<= $Perm.No (* $k@11@00 $k@7@00))
  (<= (* $k@11@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@11@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (<= $Perm.No (* $k@12@00 $k@7@00))
  (<= (* $k@12@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@12@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    (=
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      $Snap.unit)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
    (<= $Perm.No (* (/ (to_real 3) (to_real 4)) $k@7@00))
    (<= (* (/ (to_real 3) (to_real 4)) $k@7@00) $Perm.Write)
    (=>
      (< $Perm.No (* (/ (to_real 3) (to_real 4)) $k@7@00))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
          $Ref.null)))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
; Joined path conditions
(assert (and
  (< $k@8@00 $k@6@00)
  (<= $Perm.No (- $k@6@00 $k@8@00))
  (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_2@0@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No (* $k@9@00 $k@7@00))
  (<= (* $k@9@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@9@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (<= $Perm.No (* $k@10@00 $k@7@00))
  (<= (* $k@10@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@10@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (<= $Perm.No (* $k@11@00 $k@7@00))
  (<= (* $k@11@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@11@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (<= $Perm.No (* $k@12@00 $k@7@00))
  (<= (* $k@12@00 $k@7@00) $Perm.Write)
  (=> (< $Perm.No (* $k@12@00 $k@7@00)) (not (= this$_2@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(assert (= result@1@00 (joined_unfolding@13@00 s@$ this$_2@0@00)))
(pop) ; 1
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
; ---------- FUNCTION Wand_readonly_for_writeonlyget_in_1$----------
(declare-fun this$_1@2@00 () $Ref)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_1 != null
(assert (not (= this$_1@2@00 $Ref.null)))
(declare-const $k@14@00 $Perm)
(assert ($Perm.isReadVar $k@14@00))
(assert (<= $Perm.No $k@14@00))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@14@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_1@2@00 $Ref.null)))
(assert (<= $Perm.No $k@14@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Wand_readonly_for_writeonlyvalid_wand$(this$_1), wildcard) in this$_1.Wand_readonly_for_writeonlyin_1$)
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@14@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@16@00 $k@14@00))
(assert (<= $Perm.No (- $k@14@00 $k@16@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_1@2@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(assert (<= $Perm.No (* $k@17@00 $k@15@00)))
(assert (<= (* $k@17@00 $k@15@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@17@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] 1 <= this$_4.Wand_readonly_for_writeonlylemma$
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@17@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const $k@18@00 $Perm)
(assert ($Perm.isReadVar $k@18@00))
(assert (<= $Perm.No (* $k@18@00 $k@15@00)))
(assert (<= (* $k@18@00 $k@15@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@18@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(declare-const $k@19@00 $Perm)
(assert ($Perm.isReadVar $k@19@00))
(assert (<= $Perm.No (* $k@19@00 $k@15@00)))
(assert (<= (* $k@19@00 $k@15@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@19@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(declare-const $k@20@00 $Perm)
(assert ($Perm.isReadVar $k@20@00))
(assert (<= $Perm.No (* $k@20@00 $k@15@00)))
(assert (<= (* $k@20@00 $k@15@00) $Perm.Write))
(assert (=> (< $Perm.No (* $k@20@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@17@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(s@$)) == 1 | live]
; [else-branch: 1 | First:(Second:(s@$)) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | First:(Second:(s@$)) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlythis_1$ != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@20@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@20@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* (/ (to_real 3) (to_real 4)) $k@15@00)))
(assert (<= (* (/ (to_real 3) (to_real 4)) $k@15@00) $Perm.Write))
(assert (=>
  (< $Perm.No (* (/ (to_real 3) (to_real 4)) $k@15@00))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyin_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@18@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@20@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyout_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@19@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@20@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@17@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@18@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | First:(Second:(s@$)) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@17@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* $k@18@00 $k@15@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@21@00 ($Snap $Ref) $Ref)
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
  (=
    (joined_unfolding@21@00 s@$ this$_1@2@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (=
    (joined_unfolding@21@00 s@$ this$_1@2@00)
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))
; Joined path conditions
(assert ($Perm.isReadVar $k@16@00))
(assert ($Perm.isReadVar $k@17@00))
(assert ($Perm.isReadVar $k@18@00))
(assert ($Perm.isReadVar $k@19@00))
(assert ($Perm.isReadVar $k@20@00))
(assert (and
  (< $k@16@00 $k@14@00)
  (<= $Perm.No (- $k@14@00 $k@16@00))
  (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_1@2@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No (* $k@17@00 $k@15@00))
  (<= (* $k@17@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@17@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (<= $Perm.No (* $k@18@00 $k@15@00))
  (<= (* $k@18@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@18@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (<= $Perm.No (* $k@19@00 $k@15@00))
  (<= (* $k@19@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@19@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (<= $Perm.No (* $k@20@00 $k@15@00))
  (<= (* $k@20@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@20@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
  (and
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.combine
        ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
        ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
    (=
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      $Snap.unit)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
        ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
    (<= $Perm.No (* (/ (to_real 3) (to_real 4)) $k@15@00))
    (<= (* (/ (to_real 3) (to_real 4)) $k@15@00) $Perm.Write)
    (=>
      (< $Perm.No (* (/ (to_real 3) (to_real 4)) $k@15@00))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
          $Ref.null)))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
; Joined path conditions
(assert (and
  (< $k@16@00 $k@14@00)
  (<= $Perm.No (- $k@14@00 $k@16@00))
  (Wand_readonly_for_writeonlyvalid_wand$%trigger ($Snap.second s@$) this$_1@2@00)
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (<= $Perm.No (* $k@17@00 $k@15@00))
  (<= (* $k@17@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@17@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (<= 1 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (<= $Perm.No (* $k@18@00 $k@15@00))
  (<= (* $k@18@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@18@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (<= $Perm.No (* $k@19@00 $k@15@00))
  (<= (* $k@19@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@19@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (<= $Perm.No (* $k@20@00 $k@15@00))
  (<= (* $k@20@00 $k@15@00) $Perm.Write)
  (=> (< $Perm.No (* $k@20@00 $k@15@00)) (not (= this$_1@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      $Snap.unit)
    (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
(assert (= result@3@00 (joined_unfolding@21@00 s@$ this$_1@2@00)))
(pop) ; 1
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
; ---------- FUNCTION WandDemoget$----------
(declare-fun this$_9@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] this$_9 != null
(assert (not (= this$_9@4@00 $Ref.null)))
(declare-const $k@22@00 $Perm)
(assert ($Perm.isReadVar $k@22@00))
(assert (<= $Perm.No $k@22@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  (= (WandDemoget$%limited s@$ this$_9@4@00) (WandDemoget$ s@$ this$_9@4@00))
  :pattern ((WandDemoget$ s@$ this$_9@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this$_9@4@00 $Ref)) (!
  (WandDemoget$%stateless this$_9@4@00)
  :pattern ((WandDemoget$%limited s@$ this$_9@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@22@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (not (= this$_9@4@00 $Ref.null)))
(assert (<= $Perm.No $k@22@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(WandDemoreadonly$(this$_9), wildcard) in this$_9.WandDemox$)
(declare-const $k@23@00 $Perm)
(assert ($Perm.isReadVar $k@23@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@23@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@24@00 $Perm)
(assert ($Perm.isReadVar $k@24@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@22@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@24@00 $k@22@00))
(assert (<= $Perm.No (- $k@22@00 $k@24@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (WandDemoreadonly$%trigger ($Snap.second s@$) this$_9@4@00))
(assert (<= $Perm.No (* (/ (to_real 1) (to_real 4)) $k@23@00)))
(assert (<= (* (/ (to_real 1) (to_real 4)) $k@23@00) $Perm.Write))
(assert (=>
  (< $Perm.No (* (/ (to_real 1) (to_real 4)) $k@23@00))
  (not (= this$_9@4@00 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (* (/ (to_real 1) (to_real 4)) $k@23@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@24@00))
(assert (and
  (< $k@24@00 $k@22@00)
  (<= $Perm.No (- $k@22@00 $k@24@00))
  (WandDemoreadonly$%trigger ($Snap.second s@$) this$_9@4@00)
  (<= $Perm.No (* (/ (to_real 1) (to_real 4)) $k@23@00))
  (<= (* (/ (to_real 1) (to_real 4)) $k@23@00) $Perm.Write)
  (=>
    (< $Perm.No (* (/ (to_real 1) (to_real 4)) $k@23@00))
    (not (= this$_9@4@00 $Ref.null)))))
(assert (= result@5@00 ($SortWrappers.$SnapToInt ($Snap.second s@$))))
(pop) ; 1
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
; ---------- Wand_readonly_for_writeonly$MonitorInvariant ----------
(declare-const this$@25@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@26@00 $Snap)
(assert (= $t@26@00 $Snap.unit))
(pop) ; 1
; ---------- Wand_readonly_for_writeonlyvalid_wand$ ----------
(declare-const this$_4@27@00 $Ref)
(push) ; 1
(declare-const $t@28@00 $Snap)
(assert (= $t@28@00 ($Snap.combine ($Snap.first $t@28@00) ($Snap.second $t@28@00))))
(declare-const $k@29@00 $Perm)
(assert ($Perm.isReadVar $k@29@00))
(assert (<= $Perm.No $k@29@00))
(assert (<= $k@29@00 $Perm.Write))
(assert (=> (< $Perm.No $k@29@00) (not (= this$_4@27@00 $Ref.null))))
(assert (=
  ($Snap.second $t@28@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@00))
    ($Snap.second ($Snap.second $t@28@00)))))
(assert (= ($Snap.first ($Snap.second $t@28@00)) $Snap.unit))
; [eval] 1 <= this$_4.Wand_readonly_for_writeonlylemma$
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 ($SortWrappers.$SnapToInt ($Snap.first $t@28@00))))
(assert (=
  ($Snap.second ($Snap.second $t@28@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
(declare-const $k@30@00 $Perm)
(assert ($Perm.isReadVar $k@30@00))
(assert (<= $Perm.No $k@30@00))
(assert (<= $k@30@00 $Perm.Write))
(assert (=> (< $Perm.No $k@30@00) (not (= this$_4@27@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@28@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))
(declare-const $k@31@00 $Perm)
(assert ($Perm.isReadVar $k@31@00))
(assert (<= $Perm.No $k@31@00))
(assert (<= $k@31@00 $Perm.Write))
(assert (=> (< $Perm.No $k@31@00) (not (= this$_4@27@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))
(declare-const $k@32@00 $Perm)
(assert ($Perm.isReadVar $k@32@00))
(assert (<= $Perm.No $k@32@00))
(assert (<= $k@32@00 $Perm.Write))
(assert (=> (< $Perm.No $k@32@00) (not (= this$_4@27@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ == 1
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:($t@28@00) == 1 | live]
; [else-branch: 2 | First:($t@28@00) != 1 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 2 | First:($t@28@00) == 1]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlythis_1$ != null
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyin_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@30@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@28@00))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlyout_1$ == this$_4.Wand_readonly_for_writeonlythis_1$
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@31@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@32@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [else-branch: 2 | First:($t@28@00) != 1]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
  $Snap.unit))
; [eval] this$_4.Wand_readonly_for_writeonlylemma$ <= 1
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@29@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@28@00)) 1))
(pop) ; 2
(pop) ; 1
; ---------- WandDemo$MonitorInvariant ----------
(declare-const this$_6@33@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@34@00 $Snap)
(assert (= $t@34@00 $Snap.unit))
(pop) ; 1
; ---------- WandDemoreadonly$ ----------
(declare-const this$_7@35@00 $Ref)
(push) ; 1
(declare-const $t@36@00 Int)
(assert (not (= this$_7@35@00 $Ref.null)))
(pop) ; 1
; ---------- WandDemowriteonly$ ----------
(declare-const this$_8@37@00 $Ref)
(push) ; 1
(declare-const $t@38@00 Int)
(assert (not (= this$_8@37@00 $Ref.null)))
(pop) ; 1
