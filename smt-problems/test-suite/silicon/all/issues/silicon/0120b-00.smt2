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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@3@00 ($Snap $Ref) Int)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- prepend ----------
(declare-const tail@0@01 $Ref)
(declare-const v@1@01 Int)
(declare-const res@2@01 $Ref)
(declare-const tail@3@01 $Ref)
(declare-const v@4@01 Int)
(declare-const res@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] length(res) == old(length(tail)) + 1
; [eval] length(res)
(push) ; 3
(assert (length%precondition ($Snap.first $t@7@01) res@5@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@7@01) res@5@01))
; [eval] old(length(tail)) + 1
; [eval] old(length(tail))
; [eval] length(tail)
(push) ; 3
(assert (length%precondition $t@6@01 tail@3@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition $t@6@01 tail@3@01))
(assert (= (length ($Snap.first $t@7@01) res@5@01) (+ (length $t@6@01 tail@3@01) 1)))
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Ref
(declare-const tmp@8@01 $Ref)
; [exec]
; res := new(val, next)
(declare-const res@9@01 $Ref)
(assert (not (= res@9@01 $Ref.null)))
(declare-const val@10@01 Int)
(declare-const next@11@01 $Ref)
(assert (not (= res@9@01 res@5@01)))
(assert (not (= res@9@01 tmp@8@01)))
(assert (not (= res@9@01 tail@3@01)))
; [exec]
; res.val := v
; [exec]
; tmp := new(a)
(declare-const tmp@12@01 $Ref)
(assert (not (= tmp@12@01 $Ref.null)))
(declare-const a@13@01 $Ref)
(assert (not (= tmp@12@01 tmp@8@01)))
(assert (not (= tmp@12@01 tail@3@01)))
(assert (not (= tmp@12@01 res@9@01)))
(assert (not (= tmp@12@01 next@11@01)))
; [exec]
; tmp.a := tail
; [exec]
; inhale typeOf(tmp) == A()
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] typeOf(tmp) == A()
; [eval] typeOf(tmp)
; [eval] A()
(assert (= (typeOf<Type> tmp@12@01) (as A<Type>  Type)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; res.next := tmp
; [exec]
; unfold acc(node(tail), write)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= res@9@01 tail@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= tail@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= res@9@01 tail@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))
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
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))
  (as A<Type>  Type))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | typeOf[Type](First:(Second:($t@6@01))) == A[Type] | live]
; [else-branch: 0 | typeOf[Type](First:(Second:($t@6@01))) != A[Type] | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | typeOf[Type](First:(Second:($t@6@01))) == A[Type]]
(assert (=
  (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))
  (as A<Type>  Type)))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= tmp@12@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))) $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger $t@6@01 tail@3@01))
; [exec]
; fold acc(node(tail), write)
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))
    (as A<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | typeOf[Type](First:(Second:($t@6@01))) == A[Type] | live]
; [else-branch: 1 | typeOf[Type](First:(Second:($t@6@01))) != A[Type] | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | typeOf[Type](First:(Second:($t@6@01))) == A[Type]]
(assert (node%trigger ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))) tail@3@01))
; [exec]
; fold acc(node(res), write)
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (typeOf<Type> tmp@12@01) (as A<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | typeOf[Type](tmp@12@01) == A[Type] | live]
; [else-branch: 2 | typeOf[Type](tmp@12@01) != A[Type] | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | typeOf[Type](tmp@12@01) == A[Type]]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@6@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
            ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))) res@9@01))
; [eval] length(res) == old(length(tail)) + 1
; [eval] length(res)
(push) ; 6
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@6@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
            ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))) res@9@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine
          ($Snap.first ($Snap.second $t@6@01))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
            ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))) res@9@01))
; [eval] old(length(tail)) + 1
; [eval] old(length(tail))
; [eval] length(tail)
(push) ; 6
(assert (length%precondition $t@6@01 tail@3@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition $t@6@01 tail@3@01))
(push) ; 6
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap v@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tmp@12@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap tail@3@01)
        ($Snap.combine
          ($Snap.first $t@6@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@6@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
              ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))) res@9@01)
  (+ (length $t@6@01 tail@3@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap v@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tmp@12@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap tail@3@01)
        ($Snap.combine
          ($Snap.first $t@6@01)
          ($Snap.combine
            ($Snap.first ($Snap.second $t@6@01))
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
              ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))) res@9@01)
  (+ (length $t@6@01 tail@3@01) 1)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | typeOf[Type](First:(Second:($t@6@01))) != A[Type]]
(assert (not
  (=
    (typeOf<Type> ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@6@01))))
    (as A<Type>  Type))))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (node%trigger $t@6@01 tail@3@01))
; [exec]
; fold acc(node(tail), write)
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
; [then-branch: 3 | typeOf[Type](First:(Second:($t@6@01))) == A[Type] | dead]
; [else-branch: 3 | typeOf[Type](First:(Second:($t@6@01))) != A[Type] | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | typeOf[Type](First:(Second:($t@6@01))) != A[Type]]
(assert (node%trigger ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit)) tail@3@01))
; [exec]
; fold acc(node(res), write)
; [eval] typeOf(this.next) == A()
; [eval] typeOf(this.next)
; [eval] A()
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= (typeOf<Type> tmp@12@01) (as A<Type>  Type)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | typeOf[Type](tmp@12@01) == A[Type] | live]
; [else-branch: 4 | typeOf[Type](tmp@12@01) != A[Type] | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | typeOf[Type](tmp@12@01) == A[Type]]
(assert (node%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))))) res@9@01))
; [eval] length(res) == old(length(tail)) + 1
; [eval] length(res)
(push) ; 6
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))))) res@9@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap v@4@01)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap tmp@12@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tail@3@01)
      ($Snap.combine
        ($Snap.first $t@6@01)
        ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))))) res@9@01))
; [eval] old(length(tail)) + 1
; [eval] old(length(tail))
; [eval] length(tail)
(push) ; 6
(assert (length%precondition $t@6@01 tail@3@01))
(pop) ; 6
; Joined path conditions
(assert (length%precondition $t@6@01 tail@3@01))
(push) ; 6
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap v@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tmp@12@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap tail@3@01)
        ($Snap.combine
          ($Snap.first $t@6@01)
          ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))))) res@9@01)
  (+ (length $t@6@01 tail@3@01) 1))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.IntTo$Snap v@4@01)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap tmp@12@01)
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap tail@3@01)
        ($Snap.combine
          ($Snap.first $t@6@01)
          ($Snap.combine ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))))) res@9@01)
  (+ (length $t@6@01 tail@3@01) 1)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
