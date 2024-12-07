(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:51:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0120b.vpr
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
(declare-sort Type 0)
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
(declare-fun $SortWrappers.TypeTo$Snap (Type) $Snap)
(declare-fun $SortWrappers.$SnapToType ($Snap) Type)
(assert (forall ((x Type)) (!
    (= x ($SortWrappers.$SnapToType($SortWrappers.TypeTo$Snap x)))
    :pattern (($SortWrappers.TypeTo$Snap x))
    :qid |$Snap.$SnapToTypeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TypeTo$Snap($SortWrappers.$SnapToType x)))
    :pattern (($SortWrappers.$SnapToType x))
    :qid |$Snap.TypeTo$SnapToType|
    )))
; ////////// Symbols
(declare-const A<Type> Type)
(declare-const B<Type> Type)
(declare-fun typeOf<Type> ($Ref) Type)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun node%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
(assert (distinct A<Type> B<Type>))
; ////////// Axioms
(assert (forall ((x $Ref)) (!
  (or
    (= (typeOf<Type> x) (as A<Type>  Type))
    (= (typeOf<Type> x) (as B<Type>  Type)))
  :pattern ((typeOf<Type> x))
  :qid |prog.ax_typeOfChoices|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION length----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@00 $Snap)
(assert (= $t@2@00 $Snap.unit))
; [eval] result >= 1
(assert (>= result@1@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) (=>
    (length%precondition s@$ this@0@00)
    (>= result@1@00 1)))
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (length%limited s@$ this@0@00))) true)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(node(this), write) in (typeOf(this.next) == B() ? 1 : 1 + length(this.next.a)))
(set-option :timeout 0)
(push) ; 2
(assert (node%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as A<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (as A<Type>  Type))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | typeOf[Type](First:(Second:(s@$))) == A[Type] | live]
; [else-branch: 0 | typeOf[Type](First:(Second:(s@$))) != A[Type] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | typeOf[Type](First:(Second:(s@$))) == A[Type]]
(assert (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (as A<Type>  Type)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null)))
; [eval] (typeOf(this.next) == B() ? 1 : 1 + length(this.next.a))
; [eval] typeOf(this.next) == B()
; [eval] typeOf(this.next)
; [eval] B()
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as B<Type>  Type)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | typeOf[Type](First:(Second:(s@$))) == B[Type] | dead]
; [else-branch: 1 | typeOf[Type](First:(Second:(s@$))) != B[Type] | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | typeOf[Type](First:(Second:(s@$))) != B[Type]]
(assert (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as B<Type>  Type))))
; [eval] 1 + length(this.next.a)
; [eval] length(this.next.a)
(push) ; 6
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as B<Type>  Type)))
  (and
    (not
      (=
        (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (as B<Type>  Type)))
    (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
(assert (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as B<Type>  Type))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | typeOf[Type](First:(Second:(s@$))) != A[Type]]
(assert (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as A<Type>  Type))))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (typeOf(this.next) == B() ? 1 : 1 + length(this.next.a))
; [eval] typeOf(this.next) == B()
; [eval] typeOf(this.next)
; [eval] B()
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as B<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (as B<Type>  Type))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | typeOf[Type](First:(Second:(s@$))) == B[Type] | live]
; [else-branch: 2 | typeOf[Type](First:(Second:(s@$))) != B[Type] | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | typeOf[Type](First:(Second:(s@$))) == B[Type]]
(assert (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (as B<Type>  Type)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
  (as B<Type>  Type)))
(pop) ; 3
(pop) ; 2
(declare-fun joined_unfolding@3@00 ($Snap $Ref) Int)
(assert (=>
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as A<Type>  Type))
  (=
    (joined_unfolding@3@00 s@$ this@0@00)
    (+
      1
      (length ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
(assert (=>
  (not
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as A<Type>  Type)))
  (= (joined_unfolding@3@00 s@$ this@0@00) 1)))
; Joined path conditions
(assert (and
  (node%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as A<Type>  Type))
  (and
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as A<Type>  Type))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) $Ref.null))
    (=>
      (not
        (=
          (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
          (as B<Type>  Type)))
      (and
        (not
          (=
            (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
            (as B<Type>  Type)))
        (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
    (not
      (=
        (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (as B<Type>  Type))))))
; Joined path conditions
(assert (and
  (node%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))))
(assert (=>
  (not
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as A<Type>  Type)))
  (and
    (not
      (=
        (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (as A<Type>  Type)))
    (= ($Snap.second ($Snap.second s@$)) $Snap.unit)
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as B<Type>  Type)))))
(assert (or
  (not
    (=
      (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
      (as A<Type>  Type)))
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
    (as A<Type>  Type))))
(assert (= result@1@00 (joined_unfolding@3@00 s@$ this@0@00)))
; [eval] result >= 1
(push) ; 2
(assert (not (>= result@1@00 1)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 1))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (=
      (length s@$ this@0@00)
      (ite
        (=
          (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
          (as B<Type>  Type))
        1
        (+
          1
          (length%limited ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((length s@$ this@0@00))
  :pattern ((length%stateless this@0@00) (node%trigger s@$ this@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (length%precondition s@$ this@0@00)
    (ite
      (=
        (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (as B<Type>  Type))
      true
      (length%precondition ($Snap.second ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-5|)))
; ---------- node ----------
(declare-const this@4@00 $Ref)
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 ($Snap.combine ($Snap.first $t@5@00) ($Snap.second $t@5@00))))
(assert (not (= this@4@00 $Ref.null)))
(assert (=
  ($Snap.second $t@5@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@00))
    ($Snap.second ($Snap.second $t@5@00)))))
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(push) ; 2
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@00))))
    (as A<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@00))))
  (as A<Type>  Type))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | typeOf[Type](First:(Second:($t@5@00))) == A[Type] | live]
; [else-branch: 3 | typeOf[Type](First:(Second:($t@5@00))) != A[Type] | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 3 | typeOf[Type](First:(Second:($t@5@00))) == A[Type]]
(assert (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@00))))
  (as A<Type>  Type)))
(assert (=
  ($Snap.second ($Snap.second $t@5@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@00))))))
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@00))) $Ref.null)))
(pop) ; 2
(push) ; 2
; [else-branch: 3 | typeOf[Type](First:(Second:($t@5@00))) != A[Type]]
(assert (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@5@00))))
    (as A<Type>  Type))))
(assert (= ($Snap.second ($Snap.second $t@5@00)) $Snap.unit))
(pop) ; 2
(pop) ; 1
