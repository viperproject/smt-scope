(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:27
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/SnapshotsLocallyPackaged.vpr
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
(declare-sort $MWSF 0)
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
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
    )))
; ////////// Symbols
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun sum ($Snap $Ref) Int)
(declare-fun sum%limited ($Snap $Ref) Int)
(declare-fun sum%stateless ($Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref) Bool)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
(declare-fun pair%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@4@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (sum%limited s@$ x@0@00) (sum s@$ x@0@00))
  :pattern ((sum s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (sum%stateless x@0@00)
  :pattern ((sum%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (sum%precondition s@$ x@0@00)
    (=
      (sum s@$ x@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((sum s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((sum s@$ x@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (length%limited s@$ x@2@00) (length s@$ x@2@00))
  :pattern ((length s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (length%stateless x@2@00)
  :pattern ((length%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (length%precondition s@$ x@2@00)
    (=
      (length s@$ x@2@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          $Ref.null)
        1
        (+
          1
          (length%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))))
  :pattern ((length s@$ x@2@00))
  :pattern ((length%stateless x@2@00) (List%trigger s@$ x@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (length%precondition s@$ x@2@00)
    (ite
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)
      true
      (length%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))))
  :pattern ((length s@$ x@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test0 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.g := 1
; [exec]
; package acc(x.f, write) --* acc(pair(x), write) {
;   fold acc(pair(x), write)
; }
(push) ; 3
(declare-const $t@3@01 $Snap)
; [exec]
; fold acc(pair(x), write)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(assert (pair%trigger ($Snap.combine $t@3@01 ($SortWrappers.IntTo$Snap 1)) x@1@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(pair(x), write)
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@3@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@3@01)
    ($Snap.combine $t@3@01 ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-8|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@3@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@4@01 $t@3@01)
    ($Snap.combine $t@3@01 ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@4@01 $t@3@01))
  :qid |quant-u-9|)))
(assert true)
; [exec]
; x.f := 2
; [exec]
; apply acc(x.f, write) --* acc(pair(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert sum(x) == 3
; [eval] sum(x) == 3
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 4
(assert (sum%precondition (MWSF_apply mwsf@4@01 ($SortWrappers.IntTo$Snap 2)) x@1@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition (MWSF_apply mwsf@4@01 ($SortWrappers.IntTo$Snap 2)) x@1@01))
(push) ; 4
(assert (not (= (sum (MWSF_apply mwsf@4@01 ($SortWrappers.IntTo$Snap 2)) x@1@01) 3)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (sum (MWSF_apply mwsf@4@01 ($SortWrappers.IntTo$Snap 2)) x@1@01) 3))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
(declare-const x@5@01 $Ref)
(declare-const x@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (not (= x@6@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; x.g := 1
; [exec]
; package acc(x.f, write) --* acc(x.f, write) && acc(x.g, write) {
; }
(push) ; 3
(declare-const $t@8@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && acc(x.g, write)
(declare-const mwsf@9@01 $MWSF)
(assert (forall (($t@8@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@9@01 $t@8@01)
    ($Snap.combine $t@8@01 ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@9@01 $t@8@01))
  :qid |quant-u-10|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@8@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@9@01 $t@8@01)
    ($Snap.combine $t@8@01 ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@9@01 $t@8@01))
  :qid |quant-u-11|)))
(assert true)
; [exec]
; x.f := 2
; [exec]
; apply acc(x.f, write) --* acc(x.f, write) && acc(x.g, write)
(assert (=
  (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2)))
    ($Snap.second (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert x.f == 2 && x.g == 1
; [eval] x.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))))
  2)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))))
  2))
; [eval] x.g == 1
(push) ; 4
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))))
  1)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.second (MWSF_apply mwsf@9@01 ($SortWrappers.IntTo$Snap 2))))
  1))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@10@01 $Ref)
(declare-const x@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
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
; x.f := 2
; [exec]
; x.g := 1
; [exec]
; fold acc(pair(x), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 2)
  ($SortWrappers.IntTo$Snap 1)) x@11@01))
; [exec]
; package true --* acc(pair(x), write) {
; }
(push) ; 3
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand true --* acc(pair(x), write)
(declare-const mwsf@14@01 $MWSF)
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-12|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@13@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@14@01 $t@13@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap 1)))
  :pattern ((MWSF_apply mwsf@14@01 $t@13@01))
  :qid |quant-u-13|)))
(assert true)
; [exec]
; apply true --* acc(pair(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert sum(x) == 3
; [eval] sum(x) == 3
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 4
(assert (sum%precondition (MWSF_apply mwsf@14@01 $Snap.unit) x@11@01))
(pop) ; 4
; Joined path conditions
(assert (sum%precondition (MWSF_apply mwsf@14@01 $Snap.unit) x@11@01))
(push) ; 4
(assert (not (= (sum (MWSF_apply mwsf@14@01 $Snap.unit) x@11@01) 3)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (sum (MWSF_apply mwsf@14@01 $Snap.unit) x@11@01) 3))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const x@15@01 $Ref)
(declare-const x@16@01 $Ref)
(push) ; 1
(declare-const $t@17@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] length(x) == old(length(x))
; [eval] length(x)
(push) ; 3
(assert (length%precondition ($Snap.first $t@18@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@18@01) x@16@01))
; [eval] old(length(x))
; [eval] length(x)
(push) ; 3
(assert (length%precondition $t@17@01 x@16@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition $t@17@01 x@16@01))
(assert (= (length ($Snap.first $t@18@01) x@16@01) (length $t@17@01 x@16@01)))
(pop) ; 2
(push) ; 2
; [exec]
; package acc(List(x), write) --* acc(List(x), write) {
; }
(push) ; 3
(declare-const $t@19@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(List(x), write) --* acc(List(x), write)
(declare-const mwsf@20@01 $MWSF)
(assert (forall (($t@19@01 $Snap)) (!
  (= (MWSF_apply mwsf@20@01 $t@19@01) $t@19@01)
  :pattern ((MWSF_apply mwsf@20@01 $t@19@01))
  :qid |quant-u-14|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@19@01 $Snap)) (!
  (= (MWSF_apply mwsf@20@01 $t@19@01) $t@19@01)
  :pattern ((MWSF_apply mwsf@20@01 $t@19@01))
  :qid |quant-u-15|)))
(assert true)
; [exec]
; apply acc(List(x), write) --* acc(List(x), write)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] length(x) == old(length(x))
; [eval] length(x)
(set-option :timeout 0)
(push) ; 4
(assert (length%precondition (MWSF_apply mwsf@20@01 $t@17@01) x@16@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition (MWSF_apply mwsf@20@01 $t@17@01) x@16@01))
; [eval] old(length(x))
; [eval] length(x)
(push) ; 4
(assert (length%precondition $t@17@01 x@16@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition $t@17@01 x@16@01))
(push) ; 4
(assert (not (= (length (MWSF_apply mwsf@20@01 $t@17@01) x@16@01) (length $t@17@01 x@16@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (length (MWSF_apply mwsf@20@01 $t@17@01) x@16@01) (length $t@17@01 x@16@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@21@01 $Ref)
(declare-const x@22@01 $Ref)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 ($Snap.combine ($Snap.first $t@23@01) ($Snap.second $t@23@01))))
(assert (not (= x@22@01 $Ref.null)))
(assert (= ($Snap.second $t@23@01) $Snap.unit))
; [eval] x.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@23@01)) 1))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, 1 / 2) --* acc(x.f, 1 / 2) {
; }
(push) ; 3
(declare-const $t@24@01 $Snap)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
(declare-const mwsf@25@01 $MWSF)
(assert (forall (($t@24@01 $Snap)) (!
  (= (MWSF_apply mwsf@25@01 $t@24@01) $t@24@01)
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-16|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@24@01 $Snap)) (!
  (= (MWSF_apply mwsf@25@01 $t@24@01) $t@24@01)
  :pattern ((MWSF_apply mwsf@25@01 $t@24@01))
  :qid |quant-u-17|)))
(assert true)
; [exec]
; package acc(x.f, write) --*
; acc(x.f, write) && (acc(x.f, write) --* acc(x.f, write)) {
;   package acc(x.f, 1 / 2) --* acc(x.f, 1 / 2) {
;   }
;   apply acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
;   package acc(x.f, write) --* acc(x.f, write) {
;     apply acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
;   }
; }
(push) ; 4
(declare-const $t@26@01 $Snap)
; [exec]
; package acc(x.f, 1 / 2) --* acc(x.f, 1 / 2) {
; }
(push) ; 5
(declare-const $t@27@01 $Snap)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
(declare-const mwsf@28@01 $MWSF)
(assert (forall (($t@27@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@27@01) $t@27@01)
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-18|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
(assert (forall (($t@27@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@27@01) $t@27@01)
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-19|)))
(assert true)
; [exec]
; apply acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [exec]
; package acc(x.f, write) --* acc(x.f, write) {
;   apply acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
; }
(set-option :timeout 0)
(push) ; 6
(declare-const $t@29@01 $Snap)
; [exec]
; apply acc(x.f, 1 / 2) --* acc(x.f, 1 / 2)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@25@01 $t@29@01))
  ($SortWrappers.$SnapToInt $t@29@01)))
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write)
(declare-const mwsf@30@01 $MWSF)
(assert (forall (($t@29@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@29@01) $t@29@01)
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-20|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
(assert (forall (($t@29@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt (MWSF_apply mwsf@25@01 $t@29@01))
      ($SortWrappers.$SnapToInt $t@29@01))
    (= (MWSF_apply mwsf@30@01 $t@29@01) $t@29@01))
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-21|)))
(assert true)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@28@01 $t@26@01))
  ($SortWrappers.$SnapToInt $t@26@01)))
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
; Create MagicWandSnapFunction for wand acc(x.f, write) --* acc(x.f, write) && (acc(x.f, write) --* acc(x.f, write))
(declare-const mwsf@31@01 $MWSF)
(assert (forall (($t@26@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@31@01 $t@26@01)
    ($Snap.combine $t@26@01 ($SortWrappers.$MWSFTo$Snap mwsf@30@01)))
  :pattern ((MWSF_apply mwsf@31@01 $t@26@01))
  :qid |quant-u-22|)))
(pop) ; 6
(pop) ; 5
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@26@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt (MWSF_apply mwsf@28@01 $t@26@01))
      ($SortWrappers.$SnapToInt $t@26@01))
    (=
      (MWSF_apply mwsf@31@01 $t@26@01)
      ($Snap.combine $t@26@01 ($SortWrappers.$MWSFTo$Snap mwsf@30@01))))
  :pattern ((MWSF_apply mwsf@31@01 $t@26@01))
  :qid |quant-u-23|)))
(assert true)
(assert (forall (($t@27@01 $Snap)) (!
  (= (MWSF_apply mwsf@28@01 $t@27@01) $t@27@01)
  :pattern ((MWSF_apply mwsf@28@01 $t@27@01))
  :qid |quant-u-18|)))
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@25@01 $t@29@01))
  ($SortWrappers.$SnapToInt $t@29@01)))
(assert (forall (($t@29@01 $Snap)) (!
  (= (MWSF_apply mwsf@30@01 $t@29@01) $t@29@01)
  :pattern ((MWSF_apply mwsf@30@01 $t@29@01))
  :qid |quant-u-20|)))
; [exec]
; apply acc(x.f, write) --*
;   acc(x.f, write) && (acc(x.f, write) --* acc(x.f, write))
(assert (=
  (MWSF_apply mwsf@31@01 ($Snap.first $t@23@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply mwsf@31@01 ($Snap.first $t@23@01)))
    ($Snap.second (MWSF_apply mwsf@31@01 ($Snap.first $t@23@01))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; x.f := 2
; [exec]
; apply acc(x.f, write) --* acc(x.f, write)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [exec]
; assert x.f == 2
; [eval] x.f == 2
(set-option :timeout 0)
(push) ; 5
(assert (not (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@31@01 ($Snap.first $t@23@01)))) ($SortWrappers.IntTo$Snap 2)))
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second (MWSF_apply mwsf@31@01 ($Snap.first $t@23@01)))) ($SortWrappers.IntTo$Snap 2)))
  2))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const x@32@01 $Ref)
(declare-const x@33@01 $Ref)
(push) ; 1
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (not (= x@33@01 $Ref.null)))
(assert (= ($Snap.second $t@34@01) $Snap.unit))
; [eval] x.f == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@34@01)) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(x.f, 1 / 2) && x.f == 1 --* acc(x.f, write) && false {
; }
(push) ; 3
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] x.f == 1
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@35@01)) 1))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@34@01))))
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert false)
; Create MagicWandSnapFunction for wand acc(x.f, 1 / 2) && x.f == 1 --* acc(x.f, write) && false
(declare-const mwsf@36@01 $MWSF)
(assert (forall (($t@35@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@36@01 $t@35@01)
    ($Snap.combine ($Snap.first $t@34@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-24|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@35@01 $Snap)) (!
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first $t@35@01))
      ($SortWrappers.$SnapToInt ($Snap.first $t@34@01)))
    (=
      (MWSF_apply mwsf@36@01 $t@35@01)
      ($Snap.combine ($Snap.first $t@34@01) $Snap.unit)))
  :pattern ((MWSF_apply mwsf@36@01 $t@35@01))
  :qid |quant-u-25|)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
