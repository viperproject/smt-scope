(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:27:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/pred6.vpr
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
(declare-sort MyDomain 0)
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
(declare-fun $SortWrappers.MyDomainTo$Snap (MyDomain) $Snap)
(declare-fun $SortWrappers.$SnapToMyDomain ($Snap) MyDomain)
(assert (forall ((x MyDomain)) (!
    (= x ($SortWrappers.$SnapToMyDomain($SortWrappers.MyDomainTo$Snap x)))
    :pattern (($SortWrappers.MyDomainTo$Snap x))
    :qid |$Snap.$SnapToMyDomainTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MyDomainTo$Snap($SortWrappers.$SnapToMyDomain x)))
    :pattern (($SortWrappers.$SnapToMyDomain x))
    :qid |$Snap.MyDomainTo$SnapToMyDomain|
    )))
; ////////// Symbols
(declare-fun fst<Ref> (Int) $Ref)
(declare-fun snd<Ref> (Int) $Ref)
(declare-fun index<Int> ($Ref $Ref) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun pred%trigger ($Snap $Ref $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((i Int)) (!
  (= (index<Int> (fst<Ref> i) (snd<Ref> i)) i)
  :pattern ((fst<Ref> i) (snd<Ref> i))
  :qid |prog.index_ax|)))
(assert (forall ((a $Ref) (b $Ref)) (!
  (= (fst<Ref> (index<Int> a b)) a)
  :pattern ((index<Int> a b))
  :qid |prog.fst_ax|)))
(assert (forall ((a $Ref) (b $Ref)) (!
  (= (snd<Ref> (index<Int> a b)) b)
  :pattern ((index<Int> a b))
  :qid |prog.snd_ax|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- foo ----------
(declare-const a@0@01 $Ref)
(declare-const b@1@01 $Ref)
(declare-const a@2@01 $Ref)
(declare-const b@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (not (= a@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= a@2@01 b@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= b@3@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] a.f == 3
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@4@01)) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; fold acc(pred(a, b), write)
(assert (pred%trigger ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.first ($Snap.second $t@4@01))) a@2@01 b@3@01))
; [exec]
; quasihavocall i: Int :: pred(fst(i), snd(i))
(declare-const i@5@01 Int)
(push) ; 3
; [eval] fst(i)
; [eval] snd(i)
(pop) ; 3
; Check havocall receiver injectivity
(push) ; 3
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (= (fst<Ref> i1@5@01) (fst<Ref> i2@5@01))
      (= (snd<Ref> i1@5@01) (snd<Ref> i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |pred-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun inv@6@01 ($Ref $Ref) Int)
(declare-fun img@7@01 ($Ref $Ref) Bool)
; Definitional axioms for havocall inverse functions
(assert (forall ((i@5@01 Int)) (!
  (and
    (= (inv@6@01 (fst<Ref> i@5@01) (snd<Ref> i@5@01)) i@5@01)
    (img@7@01 (fst<Ref> i@5@01) (snd<Ref> i@5@01)))
  :pattern ((fst<Ref> i@5@01))
  :pattern ((snd<Ref> i@5@01))
  :qid |pred-invOfFct|)))
(assert (forall ((a $Ref) (b $Ref)) (!
  (=>
    (img@7@01 a b)
    (and (= (fst<Ref> (inv@6@01 a b)) a) (= (snd<Ref> (inv@6@01 a b)) b)))
  :pattern ((inv@6@01 a b))
  :qid |pred-fctOfInv|)))
(declare-const $t@8@01 $Snap)
; [exec]
; unfold acc(pred(a, b), write)
(assert (=
  (ite
    (img@7@01 a@2@01 b@3@01)
    $t@8@01
    ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01)))))
    ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@2@01 b@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (pred%trigger (ite
  (img@7@01 a@2@01 b@3@01)
  $t@8@01
  ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01)))) a@2@01 b@3@01))
; [exec]
; assert a.f == 3
; [eval] a.f == 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (ite
    (img@7@01 a@2@01 b@3@01)
    $t@8@01
    ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
  3)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= b@3@01 a@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= a@2@01 b@3@01)) (not (= b@3@01 a@2@01))))
; [eval] a.f == 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (ite
    (img@7@01 a@2@01 b@3@01)
    $t@8@01
    ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
  3)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= b@3@01 a@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= a@2@01 b@3@01)) (not (= b@3@01 a@2@01))))
; [eval] a.f == 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (ite
    (img@7@01 a@2@01 b@3@01)
    $t@8@01
    ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
  3)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= b@3@01 a@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.second (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
    ($SortWrappers.$SnapToInt ($Snap.first (ite
      (img@7@01 a@2@01 b@3@01)
      $t@8@01
      ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= a@2@01 b@3@01)) (not (= b@3@01 a@2@01))))
; [eval] a.f == 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first (ite
    (img@7@01 a@2@01 b@3@01)
    $t@8@01
    ($Snap.combine ($Snap.first $t@4@01) ($Snap.first ($Snap.second $t@4@01))))))
  3)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
