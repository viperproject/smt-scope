(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testWandDemo.vpr
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
(declare-fun Wand_readonly_for_writeonly__get_in_1 ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonly__get_in_1%limited ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonly__get_in_1%stateless ($Ref) Bool)
(declare-fun Wand_readonly_for_writeonly__get_in_1%precondition ($Snap $Ref) Bool)
(declare-fun WandDemo__get ($Snap $Ref) Int)
(declare-fun WandDemo__get%limited ($Snap $Ref) Int)
(declare-fun WandDemo__get%stateless ($Ref) Bool)
(declare-fun WandDemo__get%precondition ($Snap $Ref) Bool)
(declare-fun Wand_readonly_for_writeonly__get_out_1 ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonly__get_out_1%limited ($Snap $Ref) $Ref)
(declare-fun Wand_readonly_for_writeonly__get_out_1%stateless ($Ref) Bool)
(declare-fun Wand_readonly_for_writeonly__get_out_1%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Wand_readonly_for_writeonly__valid_wand%trigger ($Snap $Ref) Bool)
(declare-fun WandDemo__readonly%trigger ($Snap $Ref) Bool)
(declare-fun WandDemo__writeonly%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@11@00 ($Snap $Ref) $Ref)
(declare-fun $k@7@00 () $Perm)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@10@00 () $Perm)
(declare-fun joined_unfolding@17@00 ($Snap $Ref) $Ref)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=
    (Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00)
    (Wand_readonly_for_writeonly__get_in_1 s@$ diz@0@00))
  :pattern ((Wand_readonly_for_writeonly__get_in_1 s@$ diz@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (Wand_readonly_for_writeonly__get_in_1%stateless diz@0@00)
  :pattern ((Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (let ((result@1@00 (Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00))) (=>
    (Wand_readonly_for_writeonly__get_in_1%precondition s@$ diz@0@00)
    (not (= result@1@00 $Ref.null))))
  :pattern ((Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (let ((result@1@00 (Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00))) true)
  :pattern ((Wand_readonly_for_writeonly__get_in_1%limited s@$ diz@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    (=>
      (Wand_readonly_for_writeonly__get_in_1%precondition s@$ diz@0@00)
      (=
        (Wand_readonly_for_writeonly__get_in_1 s@$ diz@0@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  :pattern ((Wand_readonly_for_writeonly__get_in_1 s@$ diz@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  true
  :pattern ((Wand_readonly_for_writeonly__get_in_1 s@$ diz@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (= (WandDemo__get%limited s@$ diz@2@00) (WandDemo__get s@$ diz@2@00))
  :pattern ((WandDemo__get s@$ diz@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (WandDemo__get%stateless diz@2@00)
  :pattern ((WandDemo__get%limited s@$ diz@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (=>
    (WandDemo__get%precondition s@$ diz@2@00)
    (=
      (WandDemo__get s@$ diz@2@00)
      ($SortWrappers.$SnapToInt ($Snap.second s@$))))
  :pattern ((WandDemo__get s@$ diz@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  true
  :pattern ((WandDemo__get s@$ diz@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (=
    (Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00)
    (Wand_readonly_for_writeonly__get_out_1 s@$ diz@4@00))
  :pattern ((Wand_readonly_for_writeonly__get_out_1 s@$ diz@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (Wand_readonly_for_writeonly__get_out_1%stateless diz@4@00)
  :pattern ((Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (let ((result@5@00 (Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00))) (=>
    (Wand_readonly_for_writeonly__get_out_1%precondition s@$ diz@4@00)
    (not (= result@5@00 $Ref.null))))
  :pattern ((Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (let ((result@5@00 (Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00))) true)
  :pattern ((Wand_readonly_for_writeonly__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    (=>
      (Wand_readonly_for_writeonly__get_out_1%precondition s@$ diz@4@00)
      (=
        (Wand_readonly_for_writeonly__get_out_1 s@$ diz@4@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((Wand_readonly_for_writeonly__get_out_1 s@$ diz@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  true
  :pattern ((Wand_readonly_for_writeonly__get_out_1 s@$ diz@4@00))
  :qid |quant-u-15|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Wand_readonly_for_writeonly___apply ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const diz@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] Wand_readonly_for_writeonly__get_in_1(diz)
(push) ; 2
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_out_1(diz) != null
; [eval] Wand_readonly_for_writeonly__get_out_1(diz)
(push) ; 2
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (not
  (=
    (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] old(Wand_readonly_for_writeonly__get_out_1(diz))
; [eval] Wand_readonly_for_writeonly__get_out_1(diz)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
(declare-const $t@5@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Wand_readonly_for_writeonly__valid_wand(diz), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (<= $Perm.No $k@6@01))
(assert (<= $k@6@01 $Perm.Write))
(assert (=> (< $Perm.No $k@6@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] 1 <= diz.Wand_readonly_for_writeonly__lemma
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  1
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (<= $Perm.No $k@7@01))
(assert (<= $k@7@01 $Perm.Write))
(assert (=> (< $Perm.No $k@7@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__in_1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__out_1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (<= $Perm.No $k@9@01))
(assert (<= $k@9@01 $Perm.Write))
(assert (=> (< $Perm.No $k@9@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
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
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
; [else-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) == 1]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__this_1 != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__in_1 == diz.Wand_readonly_for_writeonly__this_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__out_1 == diz.Wand_readonly_for_writeonly__this_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__lemma <= 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Wand_readonly_for_writeonly__valid_wand%trigger ($Snap.first ($Snap.second ($Snap.second $t@4@01))) diz@2@01))
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
; [else-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) != 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) == 1]
; [exec]
; unfold acc(WandDemo__readonly(diz.Wand_readonly_for_writeonly__this_1), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (WandDemo__readonly%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
; [exec]
; fold acc(WandDemo__writeonly(diz.Wand_readonly_for_writeonly__this_1), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (WandDemo__writeonly%trigger ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
; [exec]
; assert acc(WandDemo__writeonly(old(Wand_readonly_for_writeonly__get_out_1(diz))), write)
; [eval] old(Wand_readonly_for_writeonly__get_out_1(diz))
; [eval] Wand_readonly_for_writeonly__get_out_1(diz)
(set-option :timeout 0)
(push) ; 5
; [eval] diz != null
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [exec]
; inhale false
(pop) ; 4
; [eval] !(diz.Wand_readonly_for_writeonly__lemma == 1)
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) != 1 | dead]
; [else-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) == 1]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) != 1]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  $Snap.unit))
; [eval] diz.Wand_readonly_for_writeonly__lemma <= 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unsat
(assert (Wand_readonly_for_writeonly__valid_wand%trigger ($Snap.first ($Snap.second ($Snap.second $t@4@01))) diz@2@01))
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(First:(Second:(Second:($t@4@01)))) == 1 | dead]
; [else-branch: 3 | First:(First:(Second:(Second:($t@4@01)))) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | First:(First:(Second:(Second:($t@4@01)))) != 1]
(pop) ; 4
; [eval] !(diz.Wand_readonly_for_writeonly__lemma == 1)
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) != 1 | dead]
; [else-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) == 1]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Wand_readonly_for_writeonly__Wand_readonly_for_writeonly ----------
(declare-const current_thread_id@10@01 Int)
(declare-const sys__result@11@01 $Ref)
(declare-const current_thread_id@12@01 Int)
(declare-const sys__result@13@01 $Ref)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@12@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@13@01 $Ref.null)))
(assert (=
  ($Snap.second $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@01))
    ($Snap.second ($Snap.second $t@15@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@15@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@15@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@15@01))) $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__lemma == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@15@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@15@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__in_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__out_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01))))))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__this_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@15@01)))))))))
  $Ref.null))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@16@01 $Ref)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@17@01 Int)
; [exec]
; var __flatten_15: Int
(declare-const __flatten_15@18@01 Int)
; [exec]
; diz := new(Wand_readonly_for_writeonly__lemma, Wand_readonly_for_writeonly__in_1, Wand_readonly_for_writeonly__out_1, Wand_readonly_for_writeonly__this_1)
(declare-const diz@19@01 $Ref)
(assert (not (= diz@19@01 $Ref.null)))
(declare-const Wand_readonly_for_writeonly__lemma@20@01 Int)
(declare-const Wand_readonly_for_writeonly__in_1@21@01 $Ref)
(declare-const Wand_readonly_for_writeonly__out_1@22@01 $Ref)
(declare-const Wand_readonly_for_writeonly__this_1@23@01 $Ref)
(assert (not (= diz@19@01 sys__result@13@01)))
(assert (not (= diz@19@01 diz@16@01)))
; [exec]
; __flatten_1 := 0
; [exec]
; __flatten_15 := __flatten_1
; [exec]
; diz.Wand_readonly_for_writeonly__lemma := __flatten_15
; [exec]
; diz.Wand_readonly_for_writeonly__in_1 := null
; [exec]
; diz.Wand_readonly_for_writeonly__out_1 := null
; [exec]
; diz.Wand_readonly_for_writeonly__this_1 := null
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Wand_readonly_for_writeonly__lemma, write) &&
;   sys__result.Wand_readonly_for_writeonly__lemma == 0 &&
;   (acc(sys__result.Wand_readonly_for_writeonly__in_1, write) &&
;   sys__result.Wand_readonly_for_writeonly__in_1 == null &&
;   (acc(sys__result.Wand_readonly_for_writeonly__out_1, write) &&
;   sys__result.Wand_readonly_for_writeonly__out_1 == null &&
;   (acc(sys__result.Wand_readonly_for_writeonly__this_1, write) &&
;   sys__result.Wand_readonly_for_writeonly__this_1 == null))))
; [eval] sys__result != null
; [eval] sys__result.Wand_readonly_for_writeonly__lemma == 0
; [eval] sys__result.Wand_readonly_for_writeonly__in_1 == null
; [eval] sys__result.Wand_readonly_for_writeonly__out_1 == null
; [eval] sys__result.Wand_readonly_for_writeonly__this_1 == null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- WandDemo__WandDemo ----------
(declare-const current_thread_id@24@01 Int)
(declare-const sys__result@25@01 $Ref)
(declare-const current_thread_id@26@01 Int)
(declare-const sys__result@27@01 $Ref)
(push) ; 1
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@26@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@27@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@30@01 $Ref)
; [exec]
; diz := new(WandDemo__x)
(declare-const diz@31@01 $Ref)
(assert (not (= diz@31@01 $Ref.null)))
(declare-const WandDemo__x@32@01 Int)
(assert (not (= diz@31@01 sys__result@27@01)))
(assert (not (= diz@31@01 diz@30@01)))
; [exec]
; fold acc(WandDemo__writeonly(diz), write)
(assert (WandDemo__writeonly%trigger ($SortWrappers.IntTo$Snap WandDemo__x@32@01) diz@31@01))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null && acc(WandDemo__writeonly(sys__result), write)
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- WandDemo__Wand_readonly_for_writeonly_lemma_1 ----------
(declare-const diz@33@01 $Ref)
(declare-const current_thread_id@34@01 Int)
(declare-const this_1@35@01 $Ref)
(declare-const in_1@36@01 $Ref)
(declare-const out_1@37@01 $Ref)
(declare-const sys__result@38@01 $Ref)
(declare-const diz@39@01 $Ref)
(declare-const current_thread_id@40@01 Int)
(declare-const this_1@41@01 $Ref)
(declare-const in_1@42@01 $Ref)
(declare-const out_1@43@01 $Ref)
(declare-const sys__result@44@01 $Ref)
(push) ; 1
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (= ($Snap.first $t@45@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@39@01 $Ref.null)))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(assert (= ($Snap.first ($Snap.second $t@45@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@40@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@45@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@45@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@45@01))) $Snap.unit))
; [eval] this_1 != null
(assert (not (= this_1@41@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@45@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  $Snap.unit))
; [eval] in_1 != null
(assert (not (= in_1@42@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  $Snap.unit))
; [eval] in_1 == this_1
(assert (= in_1@42@01 this_1@41@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
  $Snap.unit))
; [eval] out_1 != null
(assert (not (= out_1@43@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
  $Snap.unit))
; [eval] out_1 == this_1
(assert (= out_1@43@01 this_1@41@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (= ($Snap.first $t@46@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@44@01 $Ref.null)))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@46@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@46@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@46@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@46@01))) $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result) == in_1
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01))
(assert (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01)
  in_1@42@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@46@01))) $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result) == out_1
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01))
(assert (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@46@01))) sys__result@44@01)
  out_1@43@01))
(pop) ; 2
(push) ; 2
; [exec]
; var vwand: Ref
(declare-const vwand@47@01 $Ref)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@48@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@49@01 Int)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@50@01 $Ref)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@51@01 $Ref)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@52@01 $Ref)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@53@01 $Ref)
; [exec]
; var __flatten_17: Int
(declare-const __flatten_17@54@01 Int)
; [exec]
; var __flatten_18: Ref
(declare-const __flatten_18@55@01 $Ref)
; [exec]
; var __flatten_19: Ref
(declare-const __flatten_19@56@01 $Ref)
; [exec]
; var __flatten_20: Ref
(declare-const __flatten_20@57@01 $Ref)
; [exec]
; __flatten_2 := Wand_readonly_for_writeonly__Wand_readonly_for_writeonly(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@58@01 $Ref)
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(assert (= ($Snap.first $t@59@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@58@01 $Ref.null)))
(assert (=
  ($Snap.second $t@59@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@59@01))
    ($Snap.second ($Snap.second $t@59@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@59@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@59@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@59@01))) $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__lemma == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@59@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@59@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@59@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__in_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__out_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01))))))))
  $Snap.unit))
; [eval] sys__result.Wand_readonly_for_writeonly__this_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@59@01)))))))))
  $Ref.null))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; vwand := __flatten_2
; [exec]
; __flatten_3 := 1
; [exec]
; __flatten_17 := __flatten_3
; [exec]
; vwand.Wand_readonly_for_writeonly__lemma := __flatten_17
; [exec]
; __flatten_4 := this_1
; [exec]
; __flatten_18 := __flatten_4
; [exec]
; vwand.Wand_readonly_for_writeonly__this_1 := __flatten_18
; [exec]
; __flatten_5 := in_1
; [exec]
; __flatten_19 := __flatten_5
; [exec]
; vwand.Wand_readonly_for_writeonly__in_1 := __flatten_19
; [exec]
; __flatten_6 := out_1
; [exec]
; __flatten_20 := __flatten_6
; [exec]
; vwand.Wand_readonly_for_writeonly__out_1 := __flatten_20
; [exec]
; fold acc(Wand_readonly_for_writeonly__valid_wand(vwand), write)
(declare-const $k@60@01 $Perm)
(assert ($Perm.isReadVar $k@60@01))
(assert (< $k@60@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@60@01)))
(assert (<= (- $Perm.Write $k@60@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@60@01)) (not (= sys__result@58@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@60@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] 1 <= diz.Wand_readonly_for_writeonly__lemma
(declare-const $k@61@01 $Perm)
(assert ($Perm.isReadVar $k@61@01))
(assert (< $k@61@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@61@01)))
(assert (<= (- $Perm.Write $k@61@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@61@01)) (not (= sys__result@58@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@61@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Wand_readonly_for_writeonly__in_1 != null
(declare-const $k@62@01 $Perm)
(assert ($Perm.isReadVar $k@62@01))
(assert (< $k@62@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@62@01)))
(assert (<= (- $Perm.Write $k@62@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@62@01)) (not (= sys__result@58@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@62@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Wand_readonly_for_writeonly__out_1 != null
(declare-const $k@63@01 $Perm)
(assert ($Perm.isReadVar $k@63@01))
(assert (< $k@63@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@63@01)))
(assert (<= (- $Perm.Write $k@63@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@63@01)) (not (= sys__result@58@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@63@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] diz.Wand_readonly_for_writeonly__lemma == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | True]
; [eval] diz.Wand_readonly_for_writeonly__this_1 != null
; [eval] diz.Wand_readonly_for_writeonly__in_1 == diz.Wand_readonly_for_writeonly__this_1
; [eval] diz.Wand_readonly_for_writeonly__out_1 == diz.Wand_readonly_for_writeonly__this_1
; [eval] diz.Wand_readonly_for_writeonly__lemma <= 1
(assert (Wand_readonly_for_writeonly__valid_wand%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap in_1@42@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap out_1@43@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap this_1@41@01)
              ($Snap.combine
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)))
                $Snap.unit)))))))) sys__result@58@01))
; [exec]
; __flatten_7 := vwand
; [exec]
; sys__result := __flatten_7
; [exec]
; assert sys__result != null &&
;   (acc(Wand_readonly_for_writeonly__valid_wand(sys__result), write) &&
;   (Wand_readonly_for_writeonly__get_in_1(sys__result) == in_1 &&
;   Wand_readonly_for_writeonly__get_out_1(sys__result) == out_1))
; [eval] sys__result != null
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result) == in_1
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@42@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@43@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap this_1@41@01)
                ($Snap.combine
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)))
                  $Snap.unit))))))))) sys__result@58@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@42@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@43@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap this_1@41@01)
                ($Snap.combine
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)))
                  $Snap.unit))))))))) sys__result@58@01))
(push) ; 4
(assert (not (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@42@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@43@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap this_1@41@01)
                  ($Snap.combine
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)))
                    $Snap.unit))))))))) sys__result@58@01)
  in_1@42@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@42@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@43@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap this_1@41@01)
                  ($Snap.combine
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)))
                    $Snap.unit))))))))) sys__result@58@01)
  in_1@42@01))
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result) == out_1
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@42@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@43@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap this_1@41@01)
                ($Snap.combine
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)))
                  $Snap.unit))))))))) sys__result@58@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@42@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@43@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap this_1@41@01)
                ($Snap.combine
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)))
                  $Snap.unit))))))))) sys__result@58@01))
(push) ; 4
(assert (not (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@42@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@43@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap this_1@41@01)
                  ($Snap.combine
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)))
                    $Snap.unit))))))))) sys__result@58@01)
  out_1@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@42@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@43@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap this_1@41@01)
                  ($Snap.combine
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)))
                    $Snap.unit))))))))) sys__result@58@01)
  out_1@43@01))
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- WandDemo__set ----------
(declare-const diz@64@01 $Ref)
(declare-const current_thread_id@65@01 Int)
(declare-const v@66@01 Int)
(declare-const vwand@67@01 $Ref)
(declare-const diz@68@01 $Ref)
(declare-const current_thread_id@69@01 Int)
(declare-const v@70@01 Int)
(declare-const vwand@71@01 $Ref)
(push) ; 1
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 ($Snap.combine ($Snap.first $t@72@01) ($Snap.second $t@72@01))))
(assert (= ($Snap.first $t@72@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@68@01 $Ref.null)))
(assert (=
  ($Snap.second $t@72@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@72@01))
    ($Snap.second ($Snap.second $t@72@01)))))
(assert (= ($Snap.first ($Snap.second $t@72@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@69@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 ($Snap.combine ($Snap.first $t@73@01) ($Snap.second $t@73@01))))
(assert (=
  ($Snap.second $t@73@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@73@01))
    ($Snap.second ($Snap.second $t@73@01)))))
(assert (= ($Snap.first ($Snap.second $t@73@01)) $Snap.unit))
; [eval] vwand != null
(assert (not (= vwand@71@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@73@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@73@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@73@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@73@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@73@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@73@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@73@01))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01))
(assert (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01)
  diz@68@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@73@01))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01))
(assert (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@73@01)))) vwand@71@01)
  diz@68@01))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_8: Int
(declare-const __flatten_8@74@01 Int)
; [exec]
; var __flatten_9: Ref
(declare-const __flatten_9@75@01 $Ref)
; [exec]
; var __flatten_21: Int
(declare-const __flatten_21@76@01 Int)
; [exec]
; unfold acc(WandDemo__writeonly(diz), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (WandDemo__writeonly%trigger ($Snap.second ($Snap.second $t@72@01)) diz@68@01))
; [exec]
; __flatten_8 := v
; [exec]
; __flatten_21 := __flatten_8
; [exec]
; diz.WandDemo__x := __flatten_21
; [exec]
; fold acc(WandDemo__readonly(diz), write)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (WandDemo__readonly%trigger ($SortWrappers.IntTo$Snap v@70@01) diz@68@01))
; [exec]
; __flatten_9 := WandDemo__Wand_readonly_for_writeonly_lemma_1(diz, current_thread_id,
;   diz, diz, diz)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] this_1 != null
; [eval] in_1 != null
; [eval] in_1 == this_1
; [eval] out_1 != null
; [eval] out_1 == this_1
(declare-const sys__result@77@01 $Ref)
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 ($Snap.combine ($Snap.first $t@78@01) ($Snap.second $t@78@01))))
(assert (= ($Snap.first $t@78@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@77@01 $Ref.null)))
(assert (=
  ($Snap.second $t@78@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@78@01))
    ($Snap.second ($Snap.second $t@78@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@78@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@78@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@78@01))) $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result) == in_1
; [eval] Wand_readonly_for_writeonly__get_in_1(sys__result)
(set-option :timeout 0)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01))
(assert (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01)
  diz@68@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@78@01))) $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result) == out_1
; [eval] Wand_readonly_for_writeonly__get_out_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01))
(assert (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@78@01))) sys__result@77@01)
  diz@68@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; vwand := __flatten_9
; [eval] vwand != null
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand)
(set-option :timeout 0)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
; ---------- WandDemo__demo ----------
(declare-const diz@79@01 $Ref)
(declare-const current_thread_id@80@01 Int)
(declare-const diz@81@01 $Ref)
(declare-const current_thread_id@82@01 Int)
(push) ; 1
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 ($Snap.combine ($Snap.first $t@83@01) ($Snap.second $t@83@01))))
(assert (= ($Snap.first $t@83@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@81@01 $Ref.null)))
(assert (= ($Snap.second $t@83@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@82@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var vwand: Ref
(declare-const vwand@84@01 $Ref)
; [exec]
; var d: Ref
(declare-const d@85@01 $Ref)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@86@01 $Ref)
; [exec]
; var i: Int
(declare-const i@87@01 Int)
; [exec]
; var __flatten_12: Int
(declare-const __flatten_12@88@01 Int)
; [exec]
; var __flatten_13: Int
(declare-const __flatten_13@89@01 Int)
; [exec]
; var __flatten_25: Int
(declare-const __flatten_25@90@01 Int)
; [exec]
; var __flatten_26: Int
(declare-const __flatten_26@91@01 Int)
; [exec]
; __flatten_10 := WandDemo__WandDemo(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@92@01 $Ref)
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($Snap.first $t@93@01) ($Snap.second $t@93@01))))
(assert (= ($Snap.first $t@93@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@92@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; d := __flatten_10
; [exec]
; i := 1
(declare-const vwand@94@01 $Ref)
(declare-const __flatten_25@95@01 Int)
(declare-const __flatten_12@96@01 Int)
(declare-const __flatten_26@97@01 Int)
(declare-const __flatten_13@98@01 Int)
(declare-const i@99@01 Int)
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@100@01 Int)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
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
(pop) ; 5
(push) ; 5
; [eval] !true
(pop) ; 5
; Loop head block: Follow loop-internal edges
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
; [exec]
; vwand := WandDemo__set(d, current_thread_id, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
(declare-const vwand@101@01 $Ref)
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 ($Snap.combine ($Snap.first $t@102@01) ($Snap.second $t@102@01))))
(assert (=
  ($Snap.second $t@102@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@102@01))
    ($Snap.second ($Snap.second $t@102@01)))))
(assert (= ($Snap.first ($Snap.second $t@102@01)) $Snap.unit))
; [eval] vwand != null
(assert (not (= vwand@101@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@102@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@102@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@102@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@102@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_in_1(vwand)
(push) ; 6
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01))
(pop) ; 6
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01))
(assert (=
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01)
  sys__result@92@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@102@01))))
  $Snap.unit))
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand) == diz
; [eval] Wand_readonly_for_writeonly__get_out_1(vwand)
(push) ; 6
; [eval] diz != null
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01))
(pop) ; 6
; Joined path conditions
(assert (Wand_readonly_for_writeonly__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01))
(assert (=
  (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01)
  sys__result@92@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_25 := WandDemo__get(d)
; [eval] WandDemo__get(d)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(assert (WandDemo__get%precondition ($Snap.combine $Snap.unit ($Snap.first $t@102@01)) sys__result@92@01))
(pop) ; 6
; Joined path conditions
(assert (WandDemo__get%precondition ($Snap.combine $Snap.unit ($Snap.first $t@102@01)) sys__result@92@01))
(declare-const __flatten_25@103@01 Int)
(assert (=
  __flatten_25@103@01
  (WandDemo__get ($Snap.combine $Snap.unit ($Snap.first $t@102@01)) sys__result@92@01)))
; [exec]
; __flatten_12 := __flatten_25
; [exec]
; __flatten_26 := WandDemo__get(d)
; [eval] WandDemo__get(d)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(declare-const __flatten_26@104@01 Int)
(assert (=
  __flatten_26@104@01
  (WandDemo__get ($Snap.combine $Snap.unit ($Snap.first $t@102@01)) sys__result@92@01)))
; [exec]
; __flatten_13 := __flatten_26
; [exec]
; i := __flatten_12 + __flatten_13
; [eval] __flatten_12 + __flatten_13
(declare-const i@105@01 Int)
(assert (= i@105@01 (+ __flatten_25@103@01 __flatten_26@104@01)))
; [exec]
; Wand_readonly_for_writeonly___apply(vwand, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] Wand_readonly_for_writeonly__get_in_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  sys__result@92@01
  (Wand_readonly_for_writeonly__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] Wand_readonly_for_writeonly__get_out_1(diz) != null
; [eval] Wand_readonly_for_writeonly__get_out_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (not
  (=
    (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01)
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_readonly_for_writeonly__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@102@01)))) vwand@101@01)
    $Ref.null)))
; [eval] old(Wand_readonly_for_writeonly__get_out_1(diz))
; [eval] Wand_readonly_for_writeonly__get_out_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(declare-const $t@106@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; Loop head block: Re-establish invariant
(pop) ; 5
; [eval] !true
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
