(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:52:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0225.vpr
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
(declare-fun f2 ($Snap $Ref Int) Int)
(declare-fun f2%limited ($Snap $Ref Int) Int)
(declare-fun f2%stateless ($Ref Int) Bool)
(declare-fun f2%precondition ($Snap $Ref Int) Bool)
(declare-fun f4 ($Snap Int) Bool)
(declare-fun f4%limited ($Snap Int) Bool)
(declare-fun f4%stateless (Int) Bool)
(declare-fun f4%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 Int)) (!
  (= (f2%limited s@$ x@0@00 y@1@00) (f2 s@$ x@0@00 y@1@00))
  :pattern ((f2 s@$ x@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 Int)) (!
  (f2%stateless x@0@00 y@1@00)
  :pattern ((f2%limited s@$ x@0@00 y@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 Int)) (!
  (=> (f2%precondition s@$ x@0@00 y@1@00) (= (f2 s@$ x@0@00 y@1@00) y@1@00))
  :pattern ((f2 s@$ x@0@00 y@1@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref) (y@1@00 Int)) (!
  true
  :pattern ((f2 s@$ x@0@00 y@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (j@3@00 Int)) (!
  (= (f4%limited s@$ j@3@00) (f4 s@$ j@3@00))
  :pattern ((f4 s@$ j@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (j@3@00 Int)) (!
  (f4%stateless j@3@00)
  :pattern ((f4%limited s@$ j@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (j@3@00 Int)) (!
  (=> (f4%precondition s@$ j@3@00) (= (f4 s@$ j@3@00) true))
  :pattern ((f4 s@$ j@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (j@3@00 Int)) (!
  true
  :pattern ((f4 s@$ j@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test4 ----------
(declare-const y@0@01 $Ref)
(declare-const y@1@01 $Ref)
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
; package acc(P(), write) --*
; acc(P(), write) && (forall j: Int :: { f4(j) } f4(j)) {
; }
(push) ; 3
(declare-const $t@2@01 $Snap)
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
; [eval] (forall j: Int :: { f4(j) } f4(j))
(declare-const j@3@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] f4(j)
(push) ; 5
(assert (f4%precondition $t@2@01 j@3@01))
(pop) ; 5
; Joined path conditions
(assert (f4%precondition $t@2@01 j@3@01))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@3@01 Int)) (!
  (f4%precondition $t@2@01 j@3@01)
  :pattern ((f4%limited $t@2@01 j@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@13@37@13@59-aux|)))
(assert (forall ((j@3@01 Int)) (!
  (f4%precondition $t@2@01 j@3@01)
  :pattern ((f4%limited $t@2@01 j@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@13@37@13@59_precondition|)))
(push) ; 4
(assert (not (forall ((j@3@01 Int)) (!
  (=> (f4%precondition $t@2@01 j@3@01) (f4 $t@2@01 j@3@01))
  :pattern ((f4%limited $t@2@01 j@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@13@37@13@59|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@3@01 Int)) (!
  (f4 $t@2@01 j@3@01)
  :pattern ((f4%limited $t@2@01 j@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@13@37@13@59|)))
; Create MagicWandSnapFunction for wand acc(P(), write) --* acc(P(), write) && (forall j: Int :: { f4(j) } f4(j))
(declare-const mwsf@4@01 $MWSF)
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@2@01) ($Snap.combine $t@2@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-8|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@2@01 $Snap)) (!
  (= (MWSF_apply mwsf@4@01 $t@2@01) ($Snap.combine $t@2@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@4@01 $t@2@01))
  :qid |quant-u-9|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test ----------
(declare-const y@5@01 $Ref)
(declare-const y@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (not (= y@6@01 $Ref.null)))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (forall j: Int :: { f2(y, j) } j > 0 ==> f2(y, j) == j)
(declare-const j@8@01 Int)
(push) ; 2
; [eval] j > 0 ==> f2(y, j) == j
; [eval] j > 0
(push) ; 3
; [then-branch: 0 | j@8@01 > 0 | live]
; [else-branch: 0 | !(j@8@01 > 0) | live]
(push) ; 4
; [then-branch: 0 | j@8@01 > 0]
(assert (> j@8@01 0))
; [eval] f2(y, j) == j
; [eval] f2(y, j)
(push) ; 5
(assert (f2%precondition ($Snap.first $t@7@01) y@6@01 j@8@01))
(pop) ; 5
; Joined path conditions
(assert (f2%precondition ($Snap.first $t@7@01) y@6@01 j@8@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(j@8@01 > 0)]
(assert (not (> j@8@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> j@8@01 0)
  (and (> j@8@01 0) (f2%precondition ($Snap.first $t@7@01) y@6@01 j@8@01))))
; Joined path conditions
(assert (or (not (> j@8@01 0)) (> j@8@01 0)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@8@01 Int)) (!
  (and
    (=>
      (> j@8@01 0)
      (and (> j@8@01 0) (f2%precondition ($Snap.first $t@7@01) y@6@01 j@8@01)))
    (or (not (> j@8@01 0)) (> j@8@01 0)))
  :pattern ((f2%limited ($Snap.first $t@7@01) y@6@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@26@14@26@54-aux|)))
(assert (forall ((j@8@01 Int)) (!
  (=> (> j@8@01 0) (= (f2 ($Snap.first $t@7@01) y@6@01 j@8@01) j@8@01))
  :pattern ((f2%limited ($Snap.first $t@7@01) y@6@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@26@14@26@54|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package acc(y.v, write) --*
; acc(y.v, write) && (forall j: Int :: { f2(y, j) } j > 0 ==> f2(y, j) == j) {
; }
(push) ; 3
(declare-const $t@9@01 $Snap)
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
; [eval] (forall j: Int :: { f2(y, j) } j > 0 ==> f2(y, j) == j)
(declare-const j@10@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] j > 0 ==> f2(y, j) == j
; [eval] j > 0
(push) ; 5
; [then-branch: 1 | j@10@01 > 0 | live]
; [else-branch: 1 | !(j@10@01 > 0) | live]
(push) ; 6
; [then-branch: 1 | j@10@01 > 0]
(assert (> j@10@01 0))
; [eval] f2(y, j) == j
; [eval] f2(y, j)
(push) ; 7
(assert (f2%precondition $t@9@01 y@6@01 j@10@01))
(pop) ; 7
; Joined path conditions
(assert (f2%precondition $t@9@01 y@6@01 j@10@01))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(j@10@01 > 0)]
(assert (not (> j@10@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=> (> j@10@01 0) (and (> j@10@01 0) (f2%precondition $t@9@01 y@6@01 j@10@01))))
; Joined path conditions
(assert (or (not (> j@10@01 0)) (> j@10@01 0)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@10@01 Int)) (!
  (and
    (=>
      (> j@10@01 0)
      (and (> j@10@01 0) (f2%precondition $t@9@01 y@6@01 j@10@01)))
    (or (not (> j@10@01 0)) (> j@10@01 0)))
  :pattern ((f2%limited $t@9@01 y@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@28@38@28@78-aux|)))
(assert (forall ((j@10@01 Int)) (!
  (=> (> j@10@01 0) (f2%precondition $t@9@01 y@6@01 j@10@01))
  :pattern ((f2%limited $t@9@01 y@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@28@38@28@78_precondition|)))
(push) ; 4
(assert (not (forall ((j@10@01 Int)) (!
  (=>
    (and
      (=> (> j@10@01 0) (f2%precondition $t@9@01 y@6@01 j@10@01))
      (> j@10@01 0))
    (= (f2 $t@9@01 y@6@01 j@10@01) j@10@01))
  :pattern ((f2%limited $t@9@01 y@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@28@38@28@78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@10@01 Int)) (!
  (=> (> j@10@01 0) (= (f2 $t@9@01 y@6@01 j@10@01) j@10@01))
  :pattern ((f2%limited $t@9@01 y@6@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0225.vpr@28@38@28@78|)))
; Create MagicWandSnapFunction for wand acc(y.v, write) --* acc(y.v, write) && (forall j: Int :: { f2(y, j) } j > 0 ==> f2(y, j) == j)
(declare-const mwsf@11@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@9@01) ($Snap.combine $t@9@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@9@01))
  :qid |quant-u-10|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@11@01 $t@9@01) ($Snap.combine $t@9@01 $Snap.unit))
  :pattern ((MWSF_apply mwsf@11@01 $t@9@01))
  :qid |quant-u-11|)))
(assert true)
(pop) ; 3
(pop) ; 2
(pop) ; 1
