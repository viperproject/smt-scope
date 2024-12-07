(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/FoldUnfoldExperiments.vpr
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
(declare-fun getY ($Snap $Ref) Int)
(declare-fun getY%limited ($Snap $Ref) Int)
(declare-fun getY%stateless ($Ref) Bool)
(declare-fun getY%precondition ($Snap $Ref) Bool)
(declare-fun getX ($Snap $Ref) Int)
(declare-fun getX%limited ($Snap $Ref) Int)
(declare-fun getX%stateless ($Ref) Bool)
(declare-fun getX%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun X%trigger ($Snap $Ref) Bool)
(declare-fun Y%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (getY%limited s@$ this@0@00) (getY s@$ this@0@00))
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (getY%stateless this@0@00)
  :pattern ((getY%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (getY%precondition s@$ this@0@00)
    (= (getY s@$ this@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (getX%limited s@$ this@2@00) (getX s@$ this@2@00))
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (getX%stateless this@2@00)
  :pattern ((getX%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (getX%precondition s@$ this@2@00)
    (= (getX s@$ this@2@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- setX ----------
(declare-const this@0@01 $Ref)
(declare-const v@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const v@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] getX(this) == v
; [eval] getX(this)
(push) ; 3
(assert (getX%precondition ($Snap.first $t@5@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert (getX%precondition ($Snap.first $t@5@01) this@2@01))
(assert (= (getX ($Snap.first $t@5@01) this@2@01) v@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(X(this), write)
(assert (not (= this@2@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (X%trigger ($SortWrappers.IntTo$Snap $t@4@01) this@2@01))
; [exec]
; this.x := v
; [exec]
; fold acc(X(this), write)
(assert (X%trigger ($SortWrappers.IntTo$Snap v@3@01) this@2@01))
; [eval] getX(this) == v
; [eval] getX(this)
(set-option :timeout 0)
(push) ; 3
(assert (getX%precondition ($SortWrappers.IntTo$Snap v@3@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert (getX%precondition ($SortWrappers.IntTo$Snap v@3@01) this@2@01))
(push) ; 3
(assert (not (= (getX ($SortWrappers.IntTo$Snap v@3@01) this@2@01) v@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (getX ($SortWrappers.IntTo$Snap v@3@01) this@2@01) v@3@01))
(pop) ; 2
(pop) ; 1
; ---------- check ----------
(declare-const this@6@01 $Ref)
(declare-const this@7@01 $Ref)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (not (= this@7@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (= ($Snap.first ($Snap.second $t@9@01)) $Snap.unit))
; [eval] this.y == 2
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@9@01)) 2))
(assert (=
  ($Snap.second ($Snap.second $t@9@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@9@01))) $Snap.unit))
; [eval] getX(this) == 3
; [eval] getX(this)
(push) ; 3
(assert (getX%precondition ($Snap.first ($Snap.second ($Snap.second $t@9@01))) this@7@01))
(pop) ; 3
; Joined path conditions
(assert (getX%precondition ($Snap.first ($Snap.second ($Snap.second $t@9@01))) this@7@01))
(assert (= (getX ($Snap.first ($Snap.second ($Snap.second $t@9@01))) this@7@01) 3))
(pop) ; 2
(push) ; 2
; [exec]
; this.x := 1
; [exec]
; this.y := 2
; [exec]
; fold acc(X(this), write)
(assert (X%trigger ($SortWrappers.IntTo$Snap 1) this@7@01))
; [exec]
; fold acc(Y(this), write)
(assert (Y%trigger ($SortWrappers.IntTo$Snap 2) this@7@01))
; [exec]
; setX(this, 3)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] getX(this) == v
; [eval] getX(this)
(push) ; 3
(assert (getX%precondition ($Snap.first $t@10@01) this@7@01))
(pop) ; 3
; Joined path conditions
(assert (getX%precondition ($Snap.first $t@10@01) this@7@01))
(assert (= (getX ($Snap.first $t@10@01) this@7@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(Y(this), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [eval] this.y == 2
; [eval] getX(this) == 3
; [eval] getX(this)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
