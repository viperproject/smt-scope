(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/test2.vpr
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
(declare-fun getZ ($Snap $Ref) Int)
(declare-fun getZ%limited ($Snap $Ref) Int)
(declare-fun getZ%stateless ($Ref) Bool)
(declare-fun getZ%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun X%trigger ($Snap $Ref) Bool)
(declare-fun Y%trigger ($Snap $Ref) Bool)
(declare-fun Z%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION getY----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (getY%limited s@$ this@0@00) (getY s@$ this@0@00))
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (getY%stateless this@0@00)
  :pattern ((getY%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Y(this), write) in this.y)
(set-option :timeout 0)
(push) ; 2
(assert (Y%trigger s@$ this@0@00))
(assert (not (= this@0@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (Y%trigger s@$ this@0@00) (not (= this@0@00 $Ref.null))))
(assert (= result@1@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (getY%precondition s@$ this@0@00)
    (= (getY s@$ this@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((getY s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION getX----------
(declare-fun this@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (getX%limited s@$ this@2@00) (getX s@$ this@2@00))
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (getX%stateless this@2@00)
  :pattern ((getX%limited s@$ this@2@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(X(this), write) in this.x)
(set-option :timeout 0)
(push) ; 2
(assert (X%trigger s@$ this@2@00))
(assert (not (= this@2@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (X%trigger s@$ this@2@00) (not (= this@2@00 $Ref.null))))
(assert (= result@3@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (=>
    (getX%precondition s@$ this@2@00)
    (= (getX s@$ this@2@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((getX s@$ this@2@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION getZ----------
(declare-fun this@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (= (getZ%limited s@$ this@4@00) (getZ s@$ this@4@00))
  :pattern ((getZ s@$ this@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (getZ%stateless this@4@00)
  :pattern ((getZ%limited s@$ this@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Z(this), write) in this.z)
(set-option :timeout 0)
(push) ; 2
(assert (Z%trigger s@$ this@4@00))
(assert (not (= this@4@00 $Ref.null)))
(pop) ; 2
; Joined path conditions
(assert (and (Z%trigger s@$ this@4@00) (not (= this@4@00 $Ref.null))))
(assert (= result@5@00 ($SortWrappers.$SnapToInt s@$)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (=>
    (getZ%precondition s@$ this@4@00)
    (= (getZ s@$ this@4@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((getZ s@$ this@4@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  true
  :pattern ((getZ s@$ this@4@00))
  :qid |quant-u-11|)))
; ---------- X ----------
(declare-const this@6@00 $Ref)
(push) ; 1
(declare-const $t@7@00 Int)
(assert (not (= this@6@00 $Ref.null)))
(pop) ; 1
; ---------- Y ----------
(declare-const this@8@00 $Ref)
(push) ; 1
(declare-const $t@9@00 Int)
(assert (not (= this@8@00 $Ref.null)))
(pop) ; 1
; ---------- Z ----------
(declare-const this@10@00 $Ref)
(push) ; 1
(declare-const $t@11@00 Int)
(assert (not (= this@10@00 $Ref.null)))
(pop) ; 1
