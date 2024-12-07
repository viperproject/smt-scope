(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:32:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr
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
(declare-fun treeDegree ($Snap $Ref) Int)
(declare-fun treeDegree%limited ($Snap $Ref) Int)
(declare-fun treeDegree%stateless ($Ref) Bool)
(declare-fun treeDegree%precondition ($Snap $Ref) Bool)
(declare-fun segLength ($Snap $Ref $Ref) Int)
(declare-fun segLength%limited ($Snap $Ref $Ref) Int)
(declare-fun segLength%stateless ($Ref $Ref) Bool)
(declare-fun segLength%precondition ($Snap $Ref $Ref) Bool)
(declare-fun segDegree ($Snap $Ref $Ref Int) Int)
(declare-fun segDegree%limited ($Snap $Ref $Ref Int) Int)
(declare-fun segDegree%stateless ($Ref $Ref Int) Bool)
(declare-fun segDegree%precondition ($Snap $Ref $Ref Int) Bool)
(declare-fun treeParent ($Snap $Ref) $Ref)
(declare-fun treeParent%limited ($Snap $Ref) $Ref)
(declare-fun treeParent%stateless ($Ref) Bool)
(declare-fun treeParent%precondition ($Snap $Ref) Bool)
(declare-fun presorted ($Snap $Ref $Ref) Bool)
(declare-fun presorted%limited ($Snap $Ref $Ref) Bool)
(declare-fun presorted%stateless ($Ref $Ref) Bool)
(declare-fun presorted%precondition ($Snap $Ref $Ref) Bool)
(declare-fun segParent ($Snap $Ref $Ref) $Ref)
(declare-fun segParent%limited ($Snap $Ref $Ref) $Ref)
(declare-fun segParent%stateless ($Ref $Ref) Bool)
(declare-fun segParent%precondition ($Snap $Ref $Ref) Bool)
(declare-fun treeKey ($Snap $Ref) Int)
(declare-fun treeKey%limited ($Snap $Ref) Int)
(declare-fun treeKey%stateless ($Ref) Bool)
(declare-fun treeKey%precondition ($Snap $Ref) Bool)
(declare-fun validChildren ($Snap $Ref $Ref) Bool)
(declare-fun validChildren%limited ($Snap $Ref $Ref) Bool)
(declare-fun validChildren%stateless ($Ref $Ref) Bool)
(declare-fun validChildren%precondition ($Snap $Ref $Ref) Bool)
(declare-fun treeSize ($Snap $Ref) Int)
(declare-fun treeSize%limited ($Snap $Ref) Int)
(declare-fun treeSize%stateless ($Ref) Bool)
(declare-fun treeSize%precondition ($Snap $Ref) Bool)
(declare-fun segSize ($Snap $Ref $Ref) Int)
(declare-fun segSize%limited ($Snap $Ref $Ref) Int)
(declare-fun segSize%stateless ($Ref $Ref) Bool)
(declare-fun segSize%precondition ($Snap $Ref $Ref) Bool)
(declare-fun sorted ($Snap $Ref $Ref) Bool)
(declare-fun sorted%limited ($Snap $Ref $Ref) Bool)
(declare-fun sorted%stateless ($Ref $Ref) Bool)
(declare-fun sorted%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun tree%trigger ($Snap $Ref) Bool)
(declare-fun heapseg%trigger ($Snap $Ref $Ref) Bool)
(declare-fun heap%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION treeDegree----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@30@00 $Snap)
(assert (= $t@30@00 $Snap.unit))
; [eval] 0 <= result
(assert (<= 0 result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (treeDegree%limited s@$ this@0@00) (treeDegree s@$ this@0@00))
  :pattern ((treeDegree s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (treeDegree%stateless this@0@00)
  :pattern ((treeDegree%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (treeDegree%limited s@$ this@0@00))) (=>
    (treeDegree%precondition s@$ this@0@00)
    (<= 0 result@1@00)))
  :pattern ((treeDegree%limited s@$ this@0@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (let ((result@1@00 (treeDegree%limited s@$ this@0@00))) true)
  :pattern ((treeDegree%limited s@$ this@0@00))
  :qid |quant-u-23|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(tree(this), write) in this.degree)
(set-option :timeout 0)
(push) ; 2
(assert (tree%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@0@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(push) ; 3
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < First:(Second:(s@$)) | live]
; [else-branch: 0 | !(0 < First:(Second:(s@$))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | 0 < First:(Second:(s@$))]
(assert (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 5
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(0 < First:(Second:(s@$)))]
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (and
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
    (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 3
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(s@$))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
    this@0@00)))
(pop) ; 2
; Joined path conditions
(assert (and
  (tree%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@0@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Snap.unit)
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    $Snap.unit)
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (and
      (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
      (segDegree%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
  (or
    (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
      (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null))
      (segParent%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)))
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (=
      (segParent ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
      this@0@00))))
(assert (= result@1@00 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
; [eval] 0 <= result
(push) ; 2
(assert (not (<= 0 result@1@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 result@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (=>
    (treeDegree%precondition s@$ this@0@00)
    (=
      (treeDegree s@$ this@0@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  :pattern ((treeDegree s@$ this@0@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((treeDegree s@$ this@0@00))
  :qid |quant-u-25|)))
; ---------- FUNCTION segLength----------
(declare-fun this@2@00 () $Ref)
(declare-fun last@3@00 () $Ref)
(declare-fun result@4@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@31@00 $Snap)
(assert (= $t@31@00 $Snap.unit))
; [eval] 0 <= result
(assert (<= 0 result@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (=
    (segLength%limited s@$ this@2@00 last@3@00)
    (segLength s@$ this@2@00 last@3@00))
  :pattern ((segLength s@$ this@2@00 last@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (segLength%stateless this@2@00 last@3@00)
  :pattern ((segLength%limited s@$ this@2@00 last@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (let ((result@4@00 (segLength%limited s@$ this@2@00 last@3@00))) (=>
    (segLength%precondition s@$ this@2@00 last@3@00)
    (<= 0 result@4@00)))
  :pattern ((segLength%limited s@$ this@2@00 last@3@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (let ((result@4@00 (segLength%limited s@$ this@2@00 last@3@00))) true)
  :pattern ((segLength%limited s@$ this@2@00 last@3@00))
  :qid |quant-u-27|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (this == last ? 0 : 1 + (unfolding acc(heapseg(this, last), write) in segLength(this.sibling, last)))
; [eval] this == last
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@2@00 last@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@2@00 last@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | this@2@00 == last@3@00 | live]
; [else-branch: 2 | this@2@00 != last@3@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | this@2@00 == last@3@00]
(assert (= this@2@00 last@3@00))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | this@2@00 != last@3@00]
(assert (not (= this@2@00 last@3@00)))
; [eval] 1 + (unfolding acc(heapseg(this, last), write) in segLength(this.sibling, last))
; [eval] (unfolding acc(heapseg(this, last), write) in segLength(this.sibling, last))
(push) ; 4
(assert (heapseg%trigger s@$ this@2@00 last@3@00))
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@2@00 last@3@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | this@2@00 != last@3@00 | live]
; [else-branch: 3 | this@2@00 == last@3@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | this@2@00 != last@3@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= this@2@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(s@$)) != last@3@00 | live]
; [else-branch: 4 | First:(Second:(s@$)) == last@3@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 4 | First:(Second:(s@$)) != last@3@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first s@$) this@2@00))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first s@$) this@2@00))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | First:(Second:(s@$)) == last@3@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
    (treeParent%precondition ($Snap.first s@$) this@2@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
  (=
    (treeParent ($Snap.first s@$) this@2@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))
; [eval] segLength(this.sibling, last)
(push) ; 6
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
(pop) ; 6
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (heapseg%trigger s@$ this@2@00 last@3@00))
(assert (=>
  (not (= this@2@00 last@3@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (not (= this@2@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@3@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@3@00))
        (treeParent%precondition ($Snap.first s@$) this@2@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@3@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@3@00))
      (=
        (treeParent ($Snap.first s@$) this@2@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= this@2@00 last@3@00))
  (and
    (not (= this@2@00 last@3@00))
    (heapseg%trigger s@$ this@2@00 last@3@00)
    (=>
      (not (= this@2@00 last@3@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (not (= this@2@00 $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@3@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                last@3@00))
            (treeParent%precondition ($Snap.first s@$) this@2@00)
            (segParent%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@3@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@3@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@3@00))
          (=
            (treeParent ($Snap.first s@$) this@2@00)
            (segParent ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
        (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00))))))
(assert (or (not (= this@2@00 last@3@00)) (= this@2@00 last@3@00)))
(assert (=
  result@4@00
  (ite
    (= this@2@00 last@3@00)
    0
    (+
      1
      (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))))
; [eval] 0 <= result
(push) ; 2
(assert (not (<= 0 result@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 result@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (=>
    (segLength%precondition s@$ this@2@00 last@3@00)
    (=
      (segLength s@$ this@2@00 last@3@00)
      (ite
        (= this@2@00 last@3@00)
        0
        (+
          1
          (segLength%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))))
  :pattern ((segLength s@$ this@2@00 last@3@00))
  :pattern ((segLength%stateless this@2@00 last@3@00) (heapseg%trigger s@$ this@2@00 last@3@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (last@3@00 $Ref)) (!
  (=>
    (segLength%precondition s@$ this@2@00 last@3@00)
    (ite
      (= this@2@00 last@3@00)
      true
      (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@3@00)))
  :pattern ((segLength s@$ this@2@00 last@3@00))
  :qid |quant-u-29|)))
; ---------- FUNCTION segDegree----------
(declare-fun this@5@00 () $Ref)
(declare-fun last@6@00 () $Ref)
(declare-fun index@7@00 () Int)
(declare-fun result@8@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@7@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 2
(assert (segLength%precondition ($Snap.first s@$) this@5@00 last@6@00))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition ($Snap.first s@$) this@5@00 last@6@00))
(assert (< index@7@00 (segLength ($Snap.first s@$) this@5@00 last@6@00)))
(declare-const $t@32@00 $Snap)
(assert (= $t@32@00 $Snap.unit))
; [eval] 0 <= result
(assert (<= 0 result@8@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (=
    (segDegree%limited s@$ this@5@00 last@6@00 index@7@00)
    (segDegree s@$ this@5@00 last@6@00 index@7@00))
  :pattern ((segDegree s@$ this@5@00 last@6@00 index@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (segDegree%stateless this@5@00 last@6@00 index@7@00)
  :pattern ((segDegree%limited s@$ this@5@00 last@6@00 index@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (let ((result@8@00 (segDegree%limited s@$ this@5@00 last@6@00 index@7@00))) (=>
    (segDegree%precondition s@$ this@5@00 last@6@00 index@7@00)
    (<= 0 result@8@00)))
  :pattern ((segDegree%limited s@$ this@5@00 last@6@00 index@7@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (let ((result@8@00 (segDegree%limited s@$ this@5@00 last@6@00 index@7@00))) true)
  :pattern ((segDegree%limited s@$ this@5@00 last@6@00 index@7@00))
  :qid |quant-u-31|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (<= 0 index@7@00))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (segLength%precondition ($Snap.first s@$) this@5@00 last@6@00))
(assert (< index@7@00 (segLength ($Snap.first s@$) this@5@00 last@6@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(heapseg(this, last), write) in (index == 0 ? treeDegree(this) : segDegree(this.sibling, last, index - 1)))
(set-option :timeout 0)
(push) ; 2
(assert (heapseg%trigger ($Snap.first s@$) this@5@00 last@6@00))
; [eval] this != last
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@5@00 last@6@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@5@00 last@6@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | this@5@00 != last@6@00 | live]
; [else-branch: 5 | this@5@00 == last@6@00 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | this@5@00 != last@6@00]
(assert (not (= this@5@00 last@6@00)))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (not (= this@5@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  last@6@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@6@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(s@$))) != last@6@00 | live]
; [else-branch: 6 | First:(Second:(First:(s@$))) == last@6@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | First:(Second:(First:(s@$))) != last@6@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@6@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 6
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@5@00))
(pop) ; 6
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@5@00))
; [eval] segParent(this.sibling, last)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | First:(Second:(First:(s@$))) == last@6@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  last@6@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@6@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        last@6@00))
    (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@5@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@6@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@6@00))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@6@00))
  (=
    (treeParent ($Snap.first ($Snap.first s@$)) this@5@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))))
; [eval] (index == 0 ? treeDegree(this) : segDegree(this.sibling, last, index - 1))
; [eval] index == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@7@00 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@7@00 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | index@7@00 == 0 | live]
; [else-branch: 7 | index@7@00 != 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | index@7@00 == 0]
(assert (= index@7@00 0))
; [eval] treeDegree(this)
(push) ; 6
(assert (treeDegree%precondition ($Snap.first ($Snap.first s@$)) this@5@00))
(pop) ; 6
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first ($Snap.first s@$)) this@5@00))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | index@7@00 != 0]
(assert (not (= index@7@00 0)))
; [eval] segDegree(this.sibling, last, index - 1)
; [eval] index - 1
(push) ; 6
; [eval] 0 <= index
(push) ; 7
(assert (not (<= 0 (- index@7@00 1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- index@7@00 1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
(push) ; 7
(assert (not (<
  (- index@7@00 1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- index@7@00 1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
  index@7@00
  1)))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= 0 (- index@7@00 1))
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)
  (<
    (- index@7@00 1)
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
    index@7@00
    1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (= index@7@00 0)
  (and
    (= index@7@00 0)
    (treeDegree%precondition ($Snap.first ($Snap.first s@$)) this@5@00))))
; Joined path conditions
(assert (=>
  (not (= index@7@00 0))
  (and
    (not (= index@7@00 0))
    (<= 0 (- index@7@00 1))
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)
    (<
      (- index@7@00 1)
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
      index@7@00
      1)))))
(assert (or (not (= index@7@00 0)) (= index@7@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (heapseg%trigger ($Snap.first s@$) this@5@00 last@6@00))
(assert (=>
  (not (= this@5@00 last@6@00))
  (and
    (not (= this@5@00 last@6@00))
    (=
      ($Snap.first s@$)
      ($Snap.combine
        ($Snap.first ($Snap.first s@$))
        ($Snap.second ($Snap.first s@$))))
    (=
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first s@$)))
        ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (not (= this@5@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@6@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            last@6@00))
        (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@5@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        last@6@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@6@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@6@00))
      (=
        (treeParent ($Snap.first ($Snap.first s@$)) this@5@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)))
    (=>
      (= index@7@00 0)
      (and
        (= index@7@00 0)
        (treeDegree%precondition ($Snap.first ($Snap.first s@$)) this@5@00)))
    (=>
      (not (= index@7@00 0))
      (and
        (not (= index@7@00 0))
        (<= 0 (- index@7@00 1))
        (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00)
        (<
          (- index@7@00 1)
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
          index@7@00
          1))))
    (or (not (= index@7@00 0)) (= index@7@00 0)))))
(assert (not (= this@5@00 last@6@00)))
(assert (=
  result@8@00
  (ite
    (= index@7@00 0)
    (treeDegree ($Snap.first ($Snap.first s@$)) this@5@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
      index@7@00
      1)))))
; [eval] 0 <= result
(push) ; 2
(assert (not (<= 0 result@8@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 result@8@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (=>
    (segDegree%precondition s@$ this@5@00 last@6@00 index@7@00)
    (=
      (segDegree s@$ this@5@00 last@6@00 index@7@00)
      (ite
        (= index@7@00 0)
        (treeDegree ($Snap.first ($Snap.first s@$)) this@5@00)
        (segDegree%limited ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
          index@7@00
          1)))))
  :pattern ((segDegree s@$ this@5@00 last@6@00 index@7@00))
  :pattern ((segDegree%stateless this@5@00 last@6@00 index@7@00) (heapseg%trigger ($Snap.first s@$) this@5@00 last@6@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (this@5@00 $Ref) (last@6@00 $Ref) (index@7@00 Int)) (!
  (=>
    (segDegree%precondition s@$ this@5@00 last@6@00 index@7@00)
    (ite
      (= index@7@00 0)
      (treeDegree%precondition ($Snap.first ($Snap.first s@$)) this@5@00)
      (segDegree%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@6@00 (-
        index@7@00
        1))))
  :pattern ((segDegree s@$ this@5@00 last@6@00 index@7@00))
  :qid |quant-u-33|)))
; ---------- FUNCTION treeParent----------
(declare-fun this@9@00 () $Ref)
(declare-fun result@10@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  (= (treeParent%limited s@$ this@9@00) (treeParent s@$ this@9@00))
  :pattern ((treeParent s@$ this@9@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  (treeParent%stateless this@9@00)
  :pattern ((treeParent%limited s@$ this@9@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(tree(this), write) in this.parent)
(set-option :timeout 0)
(push) ; 2
(assert (tree%trigger s@$ this@9@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@9@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(push) ; 3
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | 0 < First:(Second:(s@$)) | live]
; [else-branch: 8 | !(0 < First:(Second:(s@$))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | 0 < First:(Second:(s@$))]
(assert (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 5
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(0 < First:(Second:(s@$)))]
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (and
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
    (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 3
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(Second:(s@$))) != Null | live]
; [else-branch: 9 | First:(Second:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | First:(Second:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
    this@9@00)))
(pop) ; 2
; Joined path conditions
(assert (and
  (tree%trigger s@$ this@9@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@9@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Snap.unit)
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    $Snap.unit)
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (and
      (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
      (segDegree%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
  (or
    (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
      (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null))
      (segParent%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)))
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (=
      (segParent ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
      this@9@00))))
(assert (=
  result@10@00
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  (=>
    (treeParent%precondition s@$ this@9@00)
    (=
      (treeParent s@$ this@9@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  :pattern ((treeParent s@$ this@9@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  true
  :pattern ((treeParent s@$ this@9@00))
  :qid |quant-u-35|)))
; ---------- FUNCTION presorted----------
(declare-fun this@11@00 () $Ref)
(declare-fun last@12@00 () $Ref)
(declare-fun result@13@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@11@00 $Ref) (last@12@00 $Ref)) (!
  (=
    (presorted%limited s@$ this@11@00 last@12@00)
    (presorted s@$ this@11@00 last@12@00))
  :pattern ((presorted s@$ this@11@00 last@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@11@00 $Ref) (last@12@00 $Ref)) (!
  (presorted%stateless this@11@00 last@12@00)
  :pattern ((presorted%limited s@$ this@11@00 last@12@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (1 < segLength(this, last) ==> (unfolding acc(heapseg(this, last), write) in treeDegree(this) <= segDegree(this.sibling, last, 0) && presorted(this.sibling, last))) && (2 < segLength(this, last) && segDegree(this, last, 0) == segDegree(this, last, 1) ==> segDegree(this, last, 1) < segDegree(this, last, 2))
; [eval] 1 < segLength(this, last) ==> (unfolding acc(heapseg(this, last), write) in treeDegree(this) <= segDegree(this.sibling, last, 0) && presorted(this.sibling, last))
; [eval] 1 < segLength(this, last)
; [eval] segLength(this, last)
(set-option :timeout 0)
(push) ; 2
(assert (segLength%precondition s@$ this@11@00 last@12@00))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition s@$ this@11@00 last@12@00))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 1 (segLength s@$ this@11@00 last@12@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 1 (segLength s@$ this@11@00 last@12@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | 1 < segLength(s@$, this@11@00, last@12@00) | live]
; [else-branch: 10 | !(1 < segLength(s@$, this@11@00, last@12@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | 1 < segLength(s@$, this@11@00, last@12@00)]
(assert (< 1 (segLength s@$ this@11@00 last@12@00)))
; [eval] (unfolding acc(heapseg(this, last), write) in treeDegree(this) <= segDegree(this.sibling, last, 0) && presorted(this.sibling, last))
(push) ; 4
(assert (heapseg%trigger s@$ this@11@00 last@12@00))
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@11@00 last@12@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= this@11@00 last@12@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | this@11@00 != last@12@00 | live]
; [else-branch: 11 | this@11@00 == last@12@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | this@11@00 != last@12@00]
(assert (not (= this@11@00 last@12@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= this@11@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(s@$)) != last@12@00 | live]
; [else-branch: 12 | First:(Second:(s@$)) == last@12@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(s@$)) != last@12@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first s@$) this@11@00))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first s@$) this@11@00))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | First:(Second:(s@$)) == last@12@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
    (treeParent%precondition ($Snap.first s@$) this@11@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
  (=
    (treeParent ($Snap.first s@$) this@11@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
; [eval] treeDegree(this) <= segDegree(this.sibling, last, 0) && presorted(this.sibling, last)
; [eval] treeDegree(this) <= segDegree(this.sibling, last, 0)
; [eval] treeDegree(this)
(push) ; 6
(assert (treeDegree%precondition ($Snap.first s@$) this@11@00))
(pop) ; 6
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first s@$) this@11@00))
; [eval] segDegree(this.sibling, last, 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(push) ; 7
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)))
(push) ; 6
; [then-branch: 13 | !(treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0)) | live]
; [else-branch: 13 | treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0) | live]
(push) ; 7
; [then-branch: 13 | !(treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0))]
(assert (not
  (<=
    (treeDegree ($Snap.first s@$) this@11@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 13 | treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0)]
(assert (<=
  (treeDegree ($Snap.first s@$) this@11@00)
  (segDegree ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)))
; [eval] presorted(this.sibling, last)
(push) ; 8
(assert (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 8
; Joined path conditions
(assert (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    (treeDegree ($Snap.first s@$) this@11@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
  (and
    (<=
      (treeDegree ($Snap.first s@$) this@11@00)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
    (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
(assert (or
  (<=
    (treeDegree ($Snap.first s@$) this@11@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
  (not
    (<=
      (treeDegree ($Snap.first s@$) this@11@00)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (heapseg%trigger s@$ this@11@00 last@12@00))
(assert (=>
  (not (= this@11@00 last@12@00))
  (and
    (not (= this@11@00 last@12@00))
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (not (= this@11@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@12@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@12@00))
        (treeParent%precondition ($Snap.first s@$) this@11@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@12@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@12@00))
      (=
        (treeParent ($Snap.first s@$) this@11@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
    (treeDegree%precondition ($Snap.first s@$) this@11@00)
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)
    (=>
      (<=
        (treeDegree ($Snap.first s@$) this@11@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
      (and
        (<=
          (treeDegree ($Snap.first s@$) this@11@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
        (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
    (or
      (<=
        (treeDegree ($Snap.first s@$) this@11@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
      (not
        (<=
          (treeDegree ($Snap.first s@$) this@11@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)))))))
(assert (not (= this@11@00 last@12@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | !(1 < segLength(s@$, this@11@00, last@12@00))]
(assert (not (< 1 (segLength s@$ this@11@00 last@12@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 1 (segLength s@$ this@11@00 last@12@00))
  (and
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (heapseg%trigger s@$ this@11@00 last@12@00)
    (=>
      (not (= this@11@00 last@12@00))
      (and
        (not (= this@11@00 last@12@00))
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (not (= this@11@00 $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@12@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                last@12@00))
            (treeParent%precondition ($Snap.first s@$) this@11@00)
            (segParent%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@12@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@12@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@12@00))
          (=
            (treeParent ($Snap.first s@$) this@11@00)
            (segParent ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
        (treeDegree%precondition ($Snap.first s@$) this@11@00)
        (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0)
        (=>
          (<=
            (treeDegree ($Snap.first s@$) this@11@00)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
          (and
            (<=
              (treeDegree ($Snap.first s@$) this@11@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
            (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
        (or
          (<=
            (treeDegree ($Snap.first s@$) this@11@00)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
          (not
            (<=
              (treeDegree ($Snap.first s@$) this@11@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))))))
    (not (= this@11@00 last@12@00)))))
; Joined path conditions
(assert (or
  (not (< 1 (segLength s@$ this@11@00 last@12@00)))
  (< 1 (segLength s@$ this@11@00 last@12@00))))
(push) ; 2
; [then-branch: 14 | !(1 < segLength(s@$, this@11@00, last@12@00) ==> treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0) && presorted(First:(Second:(Second:(s@$))), First:(Second:(s@$)), last@12@00)) | live]
; [else-branch: 14 | 1 < segLength(s@$, this@11@00, last@12@00) ==> treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0) && presorted(First:(Second:(Second:(s@$))), First:(Second:(s@$)), last@12@00) | live]
(push) ; 3
; [then-branch: 14 | !(1 < segLength(s@$, this@11@00, last@12@00) ==> treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0) && presorted(First:(Second:(Second:(s@$))), First:(Second:(s@$)), last@12@00))]
(assert (not
  (=>
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (and
      (<=
        (treeDegree ($Snap.first s@$) this@11@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
      (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | 1 < segLength(s@$, this@11@00, last@12@00) ==> treeDegree(First:(s@$), this@11@00) <= segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@12@00, 0) && presorted(First:(Second:(Second:(s@$))), First:(Second:(s@$)), last@12@00)]
(assert (=>
  (< 1 (segLength s@$ this@11@00 last@12@00))
  (and
    (<=
      (treeDegree ($Snap.first s@$) this@11@00)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
    (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))
; [eval] 2 < segLength(this, last) && segDegree(this, last, 0) == segDegree(this, last, 1) ==> segDegree(this, last, 1) < segDegree(this, last, 2)
; [eval] 2 < segLength(this, last) && segDegree(this, last, 0) == segDegree(this, last, 1)
; [eval] 2 < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [then-branch: 15 | !(2 < segLength(s@$, this@11@00, last@12@00)) | live]
; [else-branch: 15 | 2 < segLength(s@$, this@11@00, last@12@00) | live]
(push) ; 5
; [then-branch: 15 | !(2 < segLength(s@$, this@11@00, last@12@00))]
(assert (not (< 2 (segLength s@$ this@11@00 last@12@00))))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 2 < segLength(s@$, this@11@00, last@12@00)]
(assert (< 2 (segLength s@$ this@11@00 last@12@00)))
; [eval] segDegree(this, last, 0) == segDegree(this, last, 1)
; [eval] segDegree(this, last, 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< 0 (segLength s@$ this@11@00 last@12@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (segLength s@$ this@11@00 last@12@00)))
(assert (segDegree%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (< 0 (segLength s@$ this@11@00 last@12@00))
  (segDegree%precondition ($Snap.combine
    s@$
    ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)))
; [eval] segDegree(this, last, 1)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< 1 (segLength s@$ this@11@00 last@12@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (segLength s@$ this@11@00 last@12@00)))
(assert (segDegree%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))
(pop) ; 6
; Joined path conditions
(assert (and
  (< 1 (segLength s@$ this@11@00 last@12@00))
  (segDegree%precondition ($Snap.combine
    s@$
    ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (< 2 (segLength s@$ this@11@00 last@12@00))
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (< 0 (segLength s@$ this@11@00 last@12@00))
    (segDegree%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (segDegree%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))
(assert (or
  (< 2 (segLength s@$ this@11@00 last@12@00))
  (not (< 2 (segLength s@$ this@11@00 last@12@00)))))
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (=
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< 2 (segLength s@$ this@11@00 last@12@00))
  (=
    (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
    (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | 2 < segLength(s@$, this@11@00, last@12@00) && segDegree((s@$, (_, _)), this@11@00, last@12@00, 0) == segDegree((s@$, (_, _)), this@11@00, last@12@00, 1) | live]
; [else-branch: 16 | !(2 < segLength(s@$, this@11@00, last@12@00) && segDegree((s@$, (_, _)), this@11@00, last@12@00, 0) == segDegree((s@$, (_, _)), this@11@00, last@12@00, 1)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | 2 < segLength(s@$, this@11@00, last@12@00) && segDegree((s@$, (_, _)), this@11@00, last@12@00, 0) == segDegree((s@$, (_, _)), this@11@00, last@12@00, 1)]
(assert (and
  (< 2 (segLength s@$ this@11@00 last@12@00))
  (=
    (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
    (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))
; [eval] segDegree(this, last, 1) < segDegree(this, last, 2)
; [eval] segDegree(this, last, 1)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< 1 (segLength s@$ this@11@00 last@12@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (segLength s@$ this@11@00 last@12@00)))
(assert (segDegree%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))
(pop) ; 6
; Joined path conditions
(assert (and
  (< 1 (segLength s@$ this@11@00 last@12@00))
  (segDegree%precondition ($Snap.combine
    s@$
    ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
; [eval] segDegree(this, last, 2)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(pop) ; 7
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2))
(pop) ; 6
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(2 < segLength(s@$, this@11@00, last@12@00) && segDegree((s@$, (_, _)), this@11@00, last@12@00, 0) == segDegree((s@$, (_, _)), this@11@00, last@12@00, 1))]
(assert (not
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (=
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (=
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (=
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (segDegree%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)
    (segDegree%precondition ($Snap.combine
      s@$
      ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2))))
; Joined path conditions
(assert (or
  (not
    (and
      (< 2 (segLength s@$ this@11@00 last@12@00))
      (=
        (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
        (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))
  (and
    (< 2 (segLength s@$ this@11@00 last@12@00))
    (=
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
      (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (=>
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (and
      (<=
        (treeDegree ($Snap.first s@$) this@11@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
      (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
  (and
    (=>
      (< 1 (segLength s@$ this@11@00 last@12@00))
      (and
        (<=
          (treeDegree ($Snap.first s@$) this@11@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
        (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
    (=>
      (< 2 (segLength s@$ this@11@00 last@12@00))
      (and
        (< 2 (segLength s@$ this@11@00 last@12@00))
        (< 0 (segLength s@$ this@11@00 last@12@00))
        (segDegree%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
        (< 1 (segLength s@$ this@11@00 last@12@00))
        (segDegree%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
    (or
      (< 2 (segLength s@$ this@11@00 last@12@00))
      (not (< 2 (segLength s@$ this@11@00 last@12@00))))
    (=>
      (and
        (< 2 (segLength s@$ this@11@00 last@12@00))
        (=
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
      (and
        (< 2 (segLength s@$ this@11@00 last@12@00))
        (=
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))
        (< 1 (segLength s@$ this@11@00 last@12@00))
        (segDegree%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)
        (segDegree%precondition ($Snap.combine
          s@$
          ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2)))
    (or
      (not
        (and
          (< 2 (segLength s@$ this@11@00 last@12@00))
          (=
            (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
            (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))
      (and
        (< 2 (segLength s@$ this@11@00 last@12@00))
        (=
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))))))
(assert (or
  (=>
    (< 1 (segLength s@$ this@11@00 last@12@00))
    (and
      (<=
        (treeDegree ($Snap.first s@$) this@11@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
      (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
  (not
    (=>
      (< 1 (segLength s@$ this@11@00 last@12@00))
      (and
        (<=
          (treeDegree ($Snap.first s@$) this@11@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
        (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00))))))
(assert (=
  result@13@00
  (and
    (=>
      (< 1 (segLength s@$ this@11@00 last@12@00))
      (and
        (<=
          (treeDegree ($Snap.first s@$) this@11@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
        (presorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
    (=>
      (and
        (< 2 (segLength s@$ this@11@00 last@12@00))
        (=
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
          (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
      (<
        (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)
        (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@11@00 $Ref) (last@12@00 $Ref)) (!
  (=>
    (presorted%precondition s@$ this@11@00 last@12@00)
    (=
      (presorted s@$ this@11@00 last@12@00)
      (and
        (=>
          (< 1 (segLength s@$ this@11@00 last@12@00))
          (and
            (<=
              (treeDegree ($Snap.first s@$) this@11@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
            (presorted%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
        (=>
          (and
            (< 2 (segLength s@$ this@11@00 last@12@00))
            (=
              (segDegree ($Snap.combine
                s@$
                ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
              (segDegree ($Snap.combine
                s@$
                ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
          (<
            (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)
            (segDegree ($Snap.combine s@$ ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2))))))
  :pattern ((presorted s@$ this@11@00 last@12@00))
  :pattern ((presorted%stateless this@11@00 last@12@00) (heapseg%trigger s@$ this@11@00 last@12@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (this@11@00 $Ref) (last@12@00 $Ref)) (!
  (=>
    (presorted%precondition s@$ this@11@00 last@12@00)
    (and
      (and
        (segLength%precondition s@$ this@11@00 last@12@00)
        (=>
          (< 1 (segLength s@$ this@11@00 last@12@00))
          (and
            (and
              (treeDegree%precondition ($Snap.first s@$) this@11@00)
              (segDegree%precondition ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
            (=>
              (<=
                (treeDegree ($Snap.first s@$) this@11@00)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
              (presorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))))
      (=>
        (=>
          (< 1 (segLength s@$ this@11@00 last@12@00))
          (and
            (<=
              (treeDegree ($Snap.first s@$) this@11@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00 0))
            (presorted%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@12@00)))
        (and
          (and
            (segLength%precondition s@$ this@11@00 last@12@00)
            (=>
              (< 2 (segLength s@$ this@11@00 last@12@00))
              (and
                (segDegree%precondition ($Snap.combine
                  s@$
                  ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
                (segDegree%precondition ($Snap.combine
                  s@$
                  ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1))))
          (=>
            (and
              (< 2 (segLength s@$ this@11@00 last@12@00))
              (=
                (segDegree ($Snap.combine
                  s@$
                  ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 0)
                (segDegree ($Snap.combine
                  s@$
                  ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)))
            (and
              (segDegree%precondition ($Snap.combine
                s@$
                ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 1)
              (segDegree%precondition ($Snap.combine
                s@$
                ($Snap.combine $Snap.unit $Snap.unit)) this@11@00 last@12@00 2)))))))
  :pattern ((presorted s@$ this@11@00 last@12@00))
  :qid |quant-u-37|)))
; ---------- FUNCTION segParent----------
(declare-fun this@14@00 () $Ref)
(declare-fun last@15@00 () $Ref)
(declare-fun result@16@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] this != last
(assert (not (= this@14@00 last@15@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@14@00 $Ref) (last@15@00 $Ref)) (!
  (=
    (segParent%limited s@$ this@14@00 last@15@00)
    (segParent s@$ this@14@00 last@15@00))
  :pattern ((segParent s@$ this@14@00 last@15@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@14@00 $Ref) (last@15@00 $Ref)) (!
  (segParent%stateless this@14@00 last@15@00)
  :pattern ((segParent%limited s@$ this@14@00 last@15@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (not (= this@14@00 last@15@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(heapseg(this, last), write) in treeParent(this))
(set-option :timeout 0)
(push) ; 2
(assert (heapseg%trigger ($Snap.first s@$) this@14@00 last@15@00))
; [eval] this != last
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@14@00 last@15@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | this@14@00 != last@15@00 | live]
; [else-branch: 17 | this@14@00 == last@15@00 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | this@14@00 != last@15@00]
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (not (= this@14@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  last@15@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@15@00))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(First:(s@$))) != last@15@00 | live]
; [else-branch: 18 | First:(Second:(First:(s@$))) == last@15@00 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | First:(Second:(First:(s@$))) != last@15@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@15@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 6
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))
(pop) ; 6
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))
; [eval] segParent(this.sibling, last)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | First:(Second:(First:(s@$))) == last@15@00]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
  last@15@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@15@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        last@15@00))
    (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
    last@15@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@15@00))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
      last@15@00))
  (=
    (treeParent ($Snap.first ($Snap.first s@$)) this@14@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00))))
; [eval] treeParent(this)
(push) ; 4
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))
(pop) ; 4
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (heapseg%trigger ($Snap.first s@$) this@14@00 last@15@00))
(assert (=>
  (not (= this@14@00 last@15@00))
  (and
    (=
      ($Snap.first s@$)
      ($Snap.combine
        ($Snap.first ($Snap.first s@$))
        ($Snap.second ($Snap.first s@$))))
    (=
      ($Snap.second ($Snap.first s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first s@$)))
        ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (not (= this@14@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.first s@$)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@15@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
            last@15@00))
        (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00)))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
        last@15@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@15@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$))))
          last@15@00))
      (=
        (treeParent ($Snap.first ($Snap.first s@$)) this@14@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first s@$)))) last@15@00)))
    (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))))
(assert (= result@16@00 (treeParent ($Snap.first ($Snap.first s@$)) this@14@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@14@00 $Ref) (last@15@00 $Ref)) (!
  (=>
    (segParent%precondition s@$ this@14@00 last@15@00)
    (=
      (segParent s@$ this@14@00 last@15@00)
      (treeParent ($Snap.first ($Snap.first s@$)) this@14@00)))
  :pattern ((segParent s@$ this@14@00 last@15@00))
  :pattern ((segParent%stateless this@14@00 last@15@00) (heapseg%trigger ($Snap.first s@$) this@14@00 last@15@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (this@14@00 $Ref) (last@15@00 $Ref)) (!
  (=>
    (segParent%precondition s@$ this@14@00 last@15@00)
    (treeParent%precondition ($Snap.first ($Snap.first s@$)) this@14@00))
  :pattern ((segParent s@$ this@14@00 last@15@00))
  :qid |quant-u-39|)))
; ---------- FUNCTION treeKey----------
(declare-fun this@17@00 () $Ref)
(declare-fun result@18@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  (= (treeKey%limited s@$ this@17@00) (treeKey s@$ this@17@00))
  :pattern ((treeKey s@$ this@17@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  (treeKey%stateless this@17@00)
  :pattern ((treeKey%limited s@$ this@17@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(tree(this), write) in this.key)
(set-option :timeout 0)
(push) ; 2
(assert (tree%trigger s@$ this@17@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@17@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(push) ; 3
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | 0 < First:(Second:(s@$)) | live]
; [else-branch: 19 | !(0 < First:(Second:(s@$))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | 0 < First:(Second:(s@$))]
(assert (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 5
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(0 < First:(Second:(s@$)))]
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (and
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
    (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 3
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(Second:(s@$))) != Null | live]
; [else-branch: 20 | First:(Second:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | First:(Second:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
    this@17@00)))
(pop) ; 2
; Joined path conditions
(assert (and
  (tree%trigger s@$ this@17@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@17@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Snap.unit)
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    $Snap.unit)
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (and
      (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
      (segDegree%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
  (or
    (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
      (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null))
      (segParent%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)))
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (=
      (segParent ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
      this@17@00))))
(assert (= result@18@00 ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  (=>
    (treeKey%precondition s@$ this@17@00)
    (= (treeKey s@$ this@17@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((treeKey s@$ this@17@00))
  :qid |quant-u-40|)))
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  true
  :pattern ((treeKey s@$ this@17@00))
  :qid |quant-u-41|)))
; ---------- FUNCTION validChildren----------
(declare-fun this@19@00 () $Ref)
(declare-fun last@20@00 () $Ref)
(declare-fun result@21@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@19@00 $Ref) (last@20@00 $Ref)) (!
  (=
    (validChildren%limited s@$ this@19@00 last@20@00)
    (validChildren s@$ this@19@00 last@20@00))
  :pattern ((validChildren s@$ this@19@00 last@20@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (this@19@00 $Ref) (last@20@00 $Ref)) (!
  (validChildren%stateless this@19@00 last@20@00)
  :pattern ((validChildren%limited s@$ this@19@00 last@20@00))
  :qid |quant-u-15|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 1 < segLength(this, last) ==> (unfolding acc(heapseg(this, last), write) in treeDegree(this) == segDegree(this.sibling, last, 0) + 1 && validChildren(this.sibling, last))
; [eval] 1 < segLength(this, last)
; [eval] segLength(this, last)
(set-option :timeout 0)
(push) ; 2
(assert (segLength%precondition s@$ this@19@00 last@20@00))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition s@$ this@19@00 last@20@00))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 1 (segLength s@$ this@19@00 last@20@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 1 (segLength s@$ this@19@00 last@20@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | 1 < segLength(s@$, this@19@00, last@20@00) | live]
; [else-branch: 21 | !(1 < segLength(s@$, this@19@00, last@20@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 21 | 1 < segLength(s@$, this@19@00, last@20@00)]
(assert (< 1 (segLength s@$ this@19@00 last@20@00)))
; [eval] (unfolding acc(heapseg(this, last), write) in treeDegree(this) == segDegree(this.sibling, last, 0) + 1 && validChildren(this.sibling, last))
(push) ; 4
(assert (heapseg%trigger s@$ this@19@00 last@20@00))
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@19@00 last@20@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= this@19@00 last@20@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | this@19@00 != last@20@00 | live]
; [else-branch: 22 | this@19@00 == last@20@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | this@19@00 != last@20@00]
(assert (not (= this@19@00 last@20@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= this@19@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:(s@$)) != last@20@00 | live]
; [else-branch: 23 | First:(Second:(s@$)) == last@20@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 23 | First:(Second:(s@$)) != last@20@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first s@$) this@19@00))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first s@$) this@19@00))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 7
(push) ; 7
; [else-branch: 23 | First:(Second:(s@$)) == last@20@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
    (treeParent%precondition ($Snap.first s@$) this@19@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
  (=
    (treeParent ($Snap.first s@$) this@19@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
; [eval] treeDegree(this) == segDegree(this.sibling, last, 0) + 1 && validChildren(this.sibling, last)
; [eval] treeDegree(this) == segDegree(this.sibling, last, 0) + 1
; [eval] treeDegree(this)
(push) ; 6
(assert (treeDegree%precondition ($Snap.first s@$) this@19@00))
(pop) ; 6
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first s@$) this@19@00))
; [eval] segDegree(this.sibling, last, 0) + 1
; [eval] segDegree(this.sibling, last, 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(push) ; 7
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)))
(push) ; 6
; [then-branch: 24 | treeDegree(First:(s@$), this@19@00) != segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@20@00, 0) + 1 | live]
; [else-branch: 24 | treeDegree(First:(s@$), this@19@00) == segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@20@00, 0) + 1 | live]
(push) ; 7
; [then-branch: 24 | treeDegree(First:(s@$), this@19@00) != segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@20@00, 0) + 1]
(assert (not
  (=
    (treeDegree ($Snap.first s@$) this@19@00)
    (+
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
      1))))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | treeDegree(First:(s@$), this@19@00) == segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@20@00, 0) + 1]
(assert (=
  (treeDegree ($Snap.first s@$) this@19@00)
  (+
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
    1)))
; [eval] validChildren(this.sibling, last)
(push) ; 8
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 8
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (=
    (treeDegree ($Snap.first s@$) this@19@00)
    (+
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
      1))
  (and
    (=
      (treeDegree ($Snap.first s@$) this@19@00)
      (+
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
        1))
    (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))
(assert (or
  (=
    (treeDegree ($Snap.first s@$) this@19@00)
    (+
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
      1))
  (not
    (=
      (treeDegree ($Snap.first s@$) this@19@00)
      (+
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
        1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (heapseg%trigger s@$ this@19@00 last@20@00))
(assert (=>
  (not (= this@19@00 last@20@00))
  (and
    (not (= this@19@00 last@20@00))
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (not (= this@19@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@20@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@20@00))
        (treeParent%precondition ($Snap.first s@$) this@19@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@20@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@20@00))
      (=
        (treeParent ($Snap.first s@$) this@19@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
    (treeDegree%precondition ($Snap.first s@$) this@19@00)
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
    (=>
      (=
        (treeDegree ($Snap.first s@$) this@19@00)
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
          1))
      (and
        (=
          (treeDegree ($Snap.first s@$) this@19@00)
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
            1))
        (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
    (or
      (=
        (treeDegree ($Snap.first s@$) this@19@00)
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
          1))
      (not
        (=
          (treeDegree ($Snap.first s@$) this@19@00)
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
            1)))))))
(assert (not (= this@19@00 last@20@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 21 | !(1 < segLength(s@$, this@19@00, last@20@00))]
(assert (not (< 1 (segLength s@$ this@19@00 last@20@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 1 (segLength s@$ this@19@00 last@20@00))
  (and
    (< 1 (segLength s@$ this@19@00 last@20@00))
    (heapseg%trigger s@$ this@19@00 last@20@00)
    (=>
      (not (= this@19@00 last@20@00))
      (and
        (not (= this@19@00 last@20@00))
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (not (= this@19@00 $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@20@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                last@20@00))
            (treeParent%precondition ($Snap.first s@$) this@19@00)
            (segParent%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@20@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@20@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@20@00))
          (=
            (treeParent ($Snap.first s@$) this@19@00)
            (segParent ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
        (treeDegree%precondition ($Snap.first s@$) this@19@00)
        (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
        (=>
          (=
            (treeDegree ($Snap.first s@$) this@19@00)
            (+
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
              1))
          (and
            (=
              (treeDegree ($Snap.first s@$) this@19@00)
              (+
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
                1))
            (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))
        (or
          (=
            (treeDegree ($Snap.first s@$) this@19@00)
            (+
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
              1))
          (not
            (=
              (treeDegree ($Snap.first s@$) this@19@00)
              (+
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
                1))))))
    (not (= this@19@00 last@20@00)))))
; Joined path conditions
(assert (or
  (not (< 1 (segLength s@$ this@19@00 last@20@00)))
  (< 1 (segLength s@$ this@19@00 last@20@00))))
(assert (=
  result@21@00
  (=>
    (< 1 (segLength s@$ this@19@00 last@20@00))
    (and
      (=
        (treeDegree ($Snap.first s@$) this@19@00)
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
          1))
      (validChildren ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@19@00 $Ref) (last@20@00 $Ref)) (!
  (=>
    (validChildren%precondition s@$ this@19@00 last@20@00)
    (=
      (validChildren s@$ this@19@00 last@20@00)
      (=>
        (< 1 (segLength s@$ this@19@00 last@20@00))
        (and
          (=
            (treeDegree ($Snap.first s@$) this@19@00)
            (+
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
              1))
          (validChildren%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00)))))
  :pattern ((validChildren s@$ this@19@00 last@20@00))
  :pattern ((validChildren%stateless this@19@00 last@20@00) (heapseg%trigger s@$ this@19@00 last@20@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (this@19@00 $Ref) (last@20@00 $Ref)) (!
  (=>
    (validChildren%precondition s@$ this@19@00 last@20@00)
    (and
      (segLength%precondition s@$ this@19@00 last@20@00)
      (=>
        (< 1 (segLength s@$ this@19@00 last@20@00))
        (and
          (and
            (treeDegree%precondition ($Snap.first s@$) this@19@00)
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0))
          (=>
            (=
              (treeDegree ($Snap.first s@$) this@19@00)
              (+
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second s@$)))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00 0)
                1))
            (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@20@00))))))
  :pattern ((validChildren s@$ this@19@00 last@20@00))
  :qid |quant-u-43|)))
; ---------- FUNCTION treeSize----------
(declare-fun this@22@00 () $Ref)
(declare-fun result@23@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (= (treeSize%limited s@$ this@22@00) (treeSize s@$ this@22@00))
  :pattern ((treeSize s@$ this@22@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (treeSize%stateless this@22@00)
  :pattern ((treeSize%limited s@$ this@22@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(tree(this), write) in (this.degree == 0 ? 1 : 1 + segSize(this.child, null)))
(set-option :timeout 0)
(push) ; 2
(assert (tree%trigger s@$ this@22@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (not (= this@22@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(push) ; 3
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | 0 < First:(Second:(s@$)) | live]
; [else-branch: 25 | !(0 < First:(Second:(s@$))) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | 0 < First:(Second:(s@$))]
(assert (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 5
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(0 < First:(Second:(s@$)))]
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (and
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))))
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
    (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 3
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(Second:(s@$))) != Null | live]
; [else-branch: 26 | First:(Second:(Second:(s@$))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | First:(Second:(Second:(s@$))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 26 | First:(Second:(Second:(s@$))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
  $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
    this@22@00)))
; [eval] (this.degree == 0 ? 1 : 1 + segSize(this.child, null))
; [eval] this.degree == 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(s@$)) == 0 | live]
; [else-branch: 27 | First:(Second:(s@$)) != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | First:(Second:(s@$)) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
(pop) ; 4
(push) ; 4
; [else-branch: 27 | First:(Second:(s@$)) != 0]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)))
; [eval] 1 + segSize(this.child, null)
; [eval] segSize(this.child, null)
(push) ; 5
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
  (and
    (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
    (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))))
(assert (or
  (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
  (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)))
(pop) ; 2
; Joined path conditions
(assert (and
  (tree%trigger s@$ this@22@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (not (= this@22@00 $Ref.null))
  (=
    ($Snap.second s@$)
    ($Snap.combine
      ($Snap.first ($Snap.second s@$))
      ($Snap.second ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    $Snap.unit)
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    $Snap.unit)
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (and
      (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null))
      (segDegree%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)))
  (or
    (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
  (=>
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null 0)
      (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 1)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
    $Snap.unit)
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null))
      (segParent%precondition ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  (or
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)))
  (=>
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null))
    (=
      (segParent ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
        $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)
      this@22@00))
  (=>
    (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
    (and
      (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
      (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  (or
    (not (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))))
(assert (=
  result@23@00
  (ite
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)
    1
    (+
      1
      (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (=>
    (treeSize%precondition s@$ this@22@00)
    (=
      (treeSize s@$ this@22@00)
      (ite
        (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)
        1
        (+
          1
          (segSize%limited ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))))
  :pattern ((treeSize s@$ this@22@00))
  :pattern ((treeSize%stateless this@22@00) (tree%trigger s@$ this@22@00))
  :qid |quant-u-44|)))
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (=>
    (treeSize%precondition s@$ this@22@00)
    (ite
      (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)
      true
      (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) $Ref.null)))
  :pattern ((treeSize s@$ this@22@00))
  :qid |quant-u-45|)))
; ---------- FUNCTION segSize----------
(declare-fun this@24@00 () $Ref)
(declare-fun last@25@00 () $Ref)
(declare-fun result@26@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@33@00 $Snap)
(assert (= $t@33@00 $Snap.unit))
; [eval] this == last ==> result == 0
; [eval] this == last
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@24@00 last@25@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@24@00 last@25@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | this@24@00 == last@25@00 | live]
; [else-branch: 28 | this@24@00 != last@25@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 28 | this@24@00 == last@25@00]
(assert (= this@24@00 last@25@00))
; [eval] result == 0
(pop) ; 3
(push) ; 3
; [else-branch: 28 | this@24@00 != last@25@00]
(assert (not (= this@24@00 last@25@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= this@24@00 last@25@00)) (= this@24@00 last@25@00)))
(assert (=> (= this@24@00 last@25@00) (= result@26@00 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (=
    (segSize%limited s@$ this@24@00 last@25@00)
    (segSize s@$ this@24@00 last@25@00))
  :pattern ((segSize s@$ this@24@00 last@25@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (segSize%stateless this@24@00 last@25@00)
  :pattern ((segSize%limited s@$ this@24@00 last@25@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (let ((result@26@00 (segSize%limited s@$ this@24@00 last@25@00))) (=>
    (and
      (segSize%precondition s@$ this@24@00 last@25@00)
      (= this@24@00 last@25@00))
    (= result@26@00 0)))
  :pattern ((segSize%limited s@$ this@24@00 last@25@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (let ((result@26@00 (segSize%limited s@$ this@24@00 last@25@00))) true)
  :pattern ((segSize%limited s@$ this@24@00 last@25@00))
  :qid |quant-u-47|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (this == last ? 0 : (unfolding acc(heapseg(this, last), write) in treeSize(this) + segSize(this.sibling, last)))
; [eval] this == last
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@24@00 last@25@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@24@00 last@25@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | this@24@00 == last@25@00 | live]
; [else-branch: 29 | this@24@00 != last@25@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 29 | this@24@00 == last@25@00]
(assert (= this@24@00 last@25@00))
(pop) ; 3
(push) ; 3
; [else-branch: 29 | this@24@00 != last@25@00]
(assert (not (= this@24@00 last@25@00)))
; [eval] (unfolding acc(heapseg(this, last), write) in treeSize(this) + segSize(this.sibling, last))
(push) ; 4
(assert (heapseg%trigger s@$ this@24@00 last@25@00))
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@24@00 last@25@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | this@24@00 != last@25@00 | live]
; [else-branch: 30 | this@24@00 == last@25@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | this@24@00 != last@25@00]
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= this@24@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:(s@$)) != last@25@00 | live]
; [else-branch: 31 | First:(Second:(s@$)) == last@25@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 31 | First:(Second:(s@$)) != last@25@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first s@$) this@24@00))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first s@$) this@24@00))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
(pop) ; 7
(push) ; 7
; [else-branch: 31 | First:(Second:(s@$)) == last@25@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
    (treeParent%precondition ($Snap.first s@$) this@24@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
  (=
    (treeParent ($Snap.first s@$) this@24@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
; [eval] treeSize(this) + segSize(this.sibling, last)
; [eval] treeSize(this)
(push) ; 6
(assert (treeSize%precondition ($Snap.first s@$) this@24@00))
(pop) ; 6
; Joined path conditions
(assert (treeSize%precondition ($Snap.first s@$) this@24@00))
; [eval] segSize(this.sibling, last)
(push) ; 6
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (heapseg%trigger s@$ this@24@00 last@25@00))
(assert (=>
  (not (= this@24@00 last@25@00))
  (and
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (not (= this@24@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@25@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@25@00))
        (treeParent%precondition ($Snap.first s@$) this@24@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@25@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@25@00))
      (=
        (treeParent ($Snap.first s@$) this@24@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
    (treeSize%precondition ($Snap.first s@$) this@24@00)
    (segSize%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= this@24@00 last@25@00))
  (and
    (not (= this@24@00 last@25@00))
    (heapseg%trigger s@$ this@24@00 last@25@00)
    (=>
      (not (= this@24@00 last@25@00))
      (and
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (not (= this@24@00 $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@25@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                last@25@00))
            (treeParent%precondition ($Snap.first s@$) this@24@00)
            (segParent%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@25@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@25@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@25@00))
          (=
            (treeParent ($Snap.first s@$) this@24@00)
            (segParent ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))
        (treeSize%precondition ($Snap.first s@$) this@24@00)
        (segSize%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))))
(assert (or (not (= this@24@00 last@25@00)) (= this@24@00 last@25@00)))
(assert (=
  result@26@00
  (ite
    (= this@24@00 last@25@00)
    0
    (+
      (treeSize ($Snap.first s@$) this@24@00)
      (segSize ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))))
; [eval] this == last ==> result == 0
; [eval] this == last
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@24@00 last@25@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@24@00 last@25@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | this@24@00 == last@25@00 | live]
; [else-branch: 32 | this@24@00 != last@25@00 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 32 | this@24@00 == last@25@00]
(assert (= this@24@00 last@25@00))
; [eval] result == 0
(pop) ; 3
(push) ; 3
; [else-branch: 32 | this@24@00 != last@25@00]
(assert (not (= this@24@00 last@25@00)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(assert (not (=> (= this@24@00 last@25@00) (= result@26@00 0))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (= this@24@00 last@25@00) (= result@26@00 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (=>
    (segSize%precondition s@$ this@24@00 last@25@00)
    (=
      (segSize s@$ this@24@00 last@25@00)
      (ite
        (= this@24@00 last@25@00)
        0
        (+
          (treeSize%limited ($Snap.first s@$) this@24@00)
          (segSize%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00)))))
  :pattern ((segSize s@$ this@24@00 last@25@00))
  :pattern ((segSize%stateless this@24@00 last@25@00) (heapseg%trigger s@$ this@24@00 last@25@00))
  :qid |quant-u-48|)))
(assert (forall ((s@$ $Snap) (this@24@00 $Ref) (last@25@00 $Ref)) (!
  (=>
    (segSize%precondition s@$ this@24@00 last@25@00)
    (ite
      (= this@24@00 last@25@00)
      true
      (and
        (treeSize%precondition ($Snap.first s@$) this@24@00)
        (segSize%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@25@00))))
  :pattern ((segSize s@$ this@24@00 last@25@00))
  :qid |quant-u-49|)))
; ---------- FUNCTION sorted----------
(declare-fun this@27@00 () $Ref)
(declare-fun last@28@00 () $Ref)
(declare-fun result@29@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@34@00 $Snap)
(assert (= $t@34@00 $Snap.unit))
; [eval] result ==> presorted(this, last)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not result@29@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not result@29@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | result@29@00 | live]
; [else-branch: 33 | !(result@29@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 33 | result@29@00]
(assert result@29@00)
; [eval] presorted(this, last)
(push) ; 4
(assert (presorted%precondition s@$ this@27@00 last@28@00))
(pop) ; 4
; Joined path conditions
(assert (presorted%precondition s@$ this@27@00 last@28@00))
(pop) ; 3
(push) ; 3
; [else-branch: 33 | !(result@29@00)]
(assert (not result@29@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  result@29@00
  (and result@29@00 (presorted%precondition s@$ this@27@00 last@28@00))))
; Joined path conditions
(assert (or (not result@29@00) result@29@00))
(assert (=> result@29@00 (presorted s@$ this@27@00 last@28@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (=
    (sorted%limited s@$ this@27@00 last@28@00)
    (sorted s@$ this@27@00 last@28@00))
  :pattern ((sorted s@$ this@27@00 last@28@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (sorted%stateless this@27@00 last@28@00)
  :pattern ((sorted%limited s@$ this@27@00 last@28@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (let ((result@29@00 (sorted%limited s@$ this@27@00 last@28@00))) (=>
    (and (sorted%precondition s@$ this@27@00 last@28@00) result@29@00)
    (presorted s@$ this@27@00 last@28@00)))
  :pattern ((sorted%limited s@$ this@27@00 last@28@00))
  :qid |quant-u-50|)))
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (let ((result@29@00 (sorted%limited s@$ this@27@00 last@28@00))) (=>
    (and (sorted%precondition s@$ this@27@00 last@28@00) result@29@00)
    (presorted%precondition s@$ this@27@00 last@28@00)))
  :pattern ((sorted%limited s@$ this@27@00 last@28@00))
  :qid |quant-u-51|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 1 < segLength(this, last) ==> (unfolding acc(heapseg(this, last), write) in treeDegree(this) < segDegree(this.sibling, last, 0) && sorted(this.sibling, last))
; [eval] 1 < segLength(this, last)
; [eval] segLength(this, last)
(set-option :timeout 0)
(push) ; 2
(assert (segLength%precondition s@$ this@27@00 last@28@00))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition s@$ this@27@00 last@28@00))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 1 (segLength s@$ this@27@00 last@28@00)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 1 (segLength s@$ this@27@00 last@28@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | 1 < segLength(s@$, this@27@00, last@28@00) | live]
; [else-branch: 34 | !(1 < segLength(s@$, this@27@00, last@28@00)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | 1 < segLength(s@$, this@27@00, last@28@00)]
(assert (< 1 (segLength s@$ this@27@00 last@28@00)))
; [eval] (unfolding acc(heapseg(this, last), write) in treeDegree(this) < segDegree(this.sibling, last, 0) && sorted(this.sibling, last))
(push) ; 4
(assert (heapseg%trigger s@$ this@27@00 last@28@00))
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@27@00 last@28@00)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= this@27@00 last@28@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | this@27@00 != last@28@00 | live]
; [else-branch: 35 | this@27@00 == last@28@00 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 35 | this@27@00 != last@28@00]
(assert (not (= this@27@00 last@28@00)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (not (= this@27@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:(s@$)) != last@28@00 | live]
; [else-branch: 36 | First:(Second:(s@$)) == last@28@00 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 36 | First:(Second:(s@$)) != last@28@00]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first s@$) this@27@00))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first s@$) this@27@00))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 7
(push) ; 7
; [else-branch: 36 | First:(Second:(s@$)) == last@28@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
  (and
    (not
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
    (treeParent%precondition ($Snap.first s@$) this@27@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
(assert (=>
  (not
    (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
  (=
    (treeParent ($Snap.first s@$) this@27@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
; [eval] treeDegree(this) < segDegree(this.sibling, last, 0) && sorted(this.sibling, last)
; [eval] treeDegree(this) < segDegree(this.sibling, last, 0)
; [eval] treeDegree(this)
(push) ; 6
(assert (treeDegree%precondition ($Snap.first s@$) this@27@00))
(pop) ; 6
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first s@$) this@27@00))
; [eval] segDegree(this.sibling, last, 0)
(push) ; 6
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(push) ; 7
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second s@$)))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
(pop) ; 6
; Joined path conditions
(assert (and
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)))
(push) ; 6
; [then-branch: 37 | !(treeDegree(First:(s@$), this@27@00) < segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@28@00, 0)) | live]
; [else-branch: 37 | treeDegree(First:(s@$), this@27@00) < segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@28@00, 0) | live]
(push) ; 7
; [then-branch: 37 | !(treeDegree(First:(s@$), this@27@00) < segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@28@00, 0))]
(assert (not
  (<
    (treeDegree ($Snap.first s@$) this@27@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | treeDegree(First:(s@$), this@27@00) < segDegree((First:(Second:(Second:(s@$))), (_, _)), First:(Second:(s@$)), last@28@00, 0)]
(assert (<
  (treeDegree ($Snap.first s@$) this@27@00)
  (segDegree ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)))
; [eval] sorted(this.sibling, last)
(push) ; 8
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 8
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    (treeDegree ($Snap.first s@$) this@27@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
  (and
    (<
      (treeDegree ($Snap.first s@$) this@27@00)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
    (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))
(assert (or
  (<
    (treeDegree ($Snap.first s@$) this@27@00)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
  (not
    (<
      (treeDegree ($Snap.first s@$) this@27@00)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (heapseg%trigger s@$ this@27@00 last@28@00))
(assert (=>
  (not (= this@27@00 last@28@00))
  (and
    (not (= this@27@00 last@28@00))
    (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
    (=
      ($Snap.second s@$)
      ($Snap.combine
        ($Snap.first ($Snap.second s@$))
        ($Snap.second ($Snap.second s@$))))
    (not (= this@27@00 $Ref.null))
    (=
      ($Snap.second ($Snap.second s@$))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second s@$)))
        ($Snap.second ($Snap.second ($Snap.second s@$)))))
    (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@28@00))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@28@00))
        (treeParent%precondition ($Snap.first s@$) this@27@00)
        (segParent%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
    (or
      (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@28@00)))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
          last@28@00))
      (=
        (treeParent ($Snap.first s@$) this@27@00)
        (segParent ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
    (treeDegree%precondition ($Snap.first s@$) this@27@00)
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)
    (=>
      (<
        (treeDegree ($Snap.first s@$) this@27@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
      (and
        (<
          (treeDegree ($Snap.first s@$) this@27@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
        (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
    (or
      (<
        (treeDegree ($Snap.first s@$) this@27@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
      (not
        (<
          (treeDegree ($Snap.first s@$) this@27@00)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)))))))
(assert (not (= this@27@00 last@28@00)))
(pop) ; 3
(push) ; 3
; [else-branch: 34 | !(1 < segLength(s@$, this@27@00, last@28@00))]
(assert (not (< 1 (segLength s@$ this@27@00 last@28@00))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 1 (segLength s@$ this@27@00 last@28@00))
  (and
    (< 1 (segLength s@$ this@27@00 last@28@00))
    (heapseg%trigger s@$ this@27@00 last@28@00)
    (=>
      (not (= this@27@00 last@28@00))
      (and
        (not (= this@27@00 last@28@00))
        (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
        (=
          ($Snap.second s@$)
          ($Snap.combine
            ($Snap.first ($Snap.second s@$))
            ($Snap.second ($Snap.second s@$))))
        (not (= this@27@00 $Ref.null))
        (=
          ($Snap.second ($Snap.second s@$))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second s@$)))
            ($Snap.second ($Snap.second ($Snap.second s@$)))))
        (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit)
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@28@00))
          (and
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                last@28@00))
            (treeParent%precondition ($Snap.first s@$) this@27@00)
            (segParent%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
        (or
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
            last@28@00)
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@28@00)))
        (=>
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              last@28@00))
          (=
            (treeParent ($Snap.first s@$) this@27@00)
            (segParent ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
        (treeDegree%precondition ($Snap.first s@$) this@27@00)
        (segLength%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0)
        (=>
          (<
            (treeDegree ($Snap.first s@$) this@27@00)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
          (and
            (<
              (treeDegree ($Snap.first s@$) this@27@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
            (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))
        (or
          (<
            (treeDegree ($Snap.first s@$) this@27@00)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
          (not
            (<
              (treeDegree ($Snap.first s@$) this@27@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))))))
    (not (= this@27@00 last@28@00)))))
; Joined path conditions
(assert (or
  (not (< 1 (segLength s@$ this@27@00 last@28@00)))
  (< 1 (segLength s@$ this@27@00 last@28@00))))
(assert (=
  result@29@00
  (=>
    (< 1 (segLength s@$ this@27@00 last@28@00))
    (and
      (<
        (treeDegree ($Snap.first s@$) this@27@00)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second s@$)))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
      (sorted ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))))
; [eval] result ==> presorted(this, last)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not result@29@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not result@29@00))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | result@29@00 | live]
; [else-branch: 38 | !(result@29@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 38 | result@29@00]
(assert result@29@00)
; [eval] presorted(this, last)
(push) ; 4
(assert (presorted%precondition s@$ this@27@00 last@28@00))
(pop) ; 4
; Joined path conditions
(assert (presorted%precondition s@$ this@27@00 last@28@00))
(pop) ; 3
(push) ; 3
; [else-branch: 38 | !(result@29@00)]
(assert (not result@29@00))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  result@29@00
  (and result@29@00 (presorted%precondition s@$ this@27@00 last@28@00))))
; Joined path conditions
(assert (or (not result@29@00) result@29@00))
(push) ; 2
(assert (not (=> result@29@00 (presorted s@$ this@27@00 last@28@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> result@29@00 (presorted s@$ this@27@00 last@28@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (=>
    (sorted%precondition s@$ this@27@00 last@28@00)
    (=
      (sorted s@$ this@27@00 last@28@00)
      (=>
        (< 1 (segLength s@$ this@27@00 last@28@00))
        (and
          (<
            (treeDegree ($Snap.first s@$) this@27@00)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
          (sorted%limited ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00)))))
  :pattern ((sorted s@$ this@27@00 last@28@00))
  :pattern ((sorted%stateless this@27@00 last@28@00) (heapseg%trigger s@$ this@27@00 last@28@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (this@27@00 $Ref) (last@28@00 $Ref)) (!
  (=>
    (sorted%precondition s@$ this@27@00 last@28@00)
    (and
      (segLength%precondition s@$ this@27@00 last@28@00)
      (=>
        (< 1 (segLength s@$ this@27@00 last@28@00))
        (and
          (and
            (treeDegree%precondition ($Snap.first s@$) this@27@00)
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second s@$)))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
          (=>
            (<
              (treeDegree ($Snap.first s@$) this@27@00)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second s@$)))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00 0))
            (sorted%precondition ($Snap.first ($Snap.second ($Snap.second s@$))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))) last@28@00))))))
  :pattern ((sorted s@$ this@27@00 last@28@00))
  :qid |quant-u-53|)))
; ---------- tree ----------
(declare-const this@35@00 $Ref)
(push) ; 1
(declare-const $t@36@00 $Snap)
(assert (= $t@36@00 ($Snap.combine ($Snap.first $t@36@00) ($Snap.second $t@36@00))))
(assert (not (= this@35@00 $Ref.null)))
(assert (=
  ($Snap.second $t@36@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@00))
    ($Snap.second ($Snap.second $t@36@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@36@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@36@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@36@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@36@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(push) ; 2
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00)))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | 0 < First:(Second:($t@36@00)) | live]
; [else-branch: 39 | !(0 < First:(Second:($t@36@00))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 39 | 0 < First:(Second:($t@36@00))]
(assert (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00)))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 4
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null 0))
(pop) ; 4
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 3
(push) ; 3
; [else-branch: 39 | !(0 < First:(Second:($t@36@00)))]
(assert (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))
  (and
    (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00)))))
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))))
(assert (=>
  (< 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null 0)
    (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@00))) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 2
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00)))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(Second:($t@36@00))) != Null | live]
; [else-branch: 40 | First:(Second:(Second:($t@36@00))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 40 | First:(Second:(Second:($t@36@00))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 4
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 40 | First:(Second:(Second:($t@36@00))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
  $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@36@00))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@36@00)))) $Ref.null)
    this@35@00)))
(pop) ; 1
; ---------- heapseg ----------
(declare-const this@37@00 $Ref)
(declare-const last@38@00 $Ref)
(push) ; 1
; [eval] this != last
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@37@00 last@38@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= this@37@00 last@38@00))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | this@37@00 != last@38@00 | live]
; [else-branch: 41 | this@37@00 == last@38@00 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 41 | this@37@00 != last@38@00]
(assert (not (= this@37@00 last@38@00)))
(declare-const $t@39@00 $Snap)
(assert (= $t@39@00 ($Snap.combine ($Snap.first $t@39@00) ($Snap.second $t@39@00))))
(assert (=
  ($Snap.second $t@39@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@00))
    ($Snap.second ($Snap.second $t@39@00)))))
(assert (not (= this@37@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@39@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@00))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@39@00))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
    last@38@00))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | First:(Second:($t@39@00)) != last@38@00 | live]
; [else-branch: 42 | First:(Second:($t@39@00)) == last@38@00 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 42 | First:(Second:($t@39@00)) != last@38@00]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
    last@38@00)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 5
(assert (treeParent%precondition ($Snap.first $t@39@00) this@37@00))
(pop) ; 5
; Joined path conditions
(assert (treeParent%precondition ($Snap.first $t@39@00) this@37@00))
; [eval] segParent(this.sibling, last)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00))
(pop) ; 4
(push) ; 4
; [else-branch: 42 | First:(Second:($t@39@00)) == last@38@00]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
      last@38@00))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
        last@38@00))
    (treeParent%precondition ($Snap.first $t@39@00) this@37@00)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
    last@38@00)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
      last@38@00))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00)))
      last@38@00))
  (=
    (treeParent ($Snap.first $t@39@00) this@37@00)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second $t@39@00)))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@39@00))) last@38@00))))
(pop) ; 2
(push) ; 2
; [else-branch: 41 | this@37@00 == last@38@00]
(assert (= this@37@00 last@38@00))
(declare-const $t@40@00 $Snap)
(assert (= $t@40@00 $Snap.unit))
(pop) ; 2
(pop) ; 1
; ---------- heap ----------
(declare-const this@41@00 $Ref)
(push) ; 1
(declare-const $t@42@00 $Snap)
(assert (= $t@42@00 ($Snap.combine ($Snap.first $t@42@00) ($Snap.second $t@42@00))))
(assert (not (= this@41@00 $Ref.null)))
(assert (=
  ($Snap.second $t@42@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@42@00))
    ($Snap.second ($Snap.second $t@42@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@42@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@42@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@42@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@42@00))) $Snap.unit))
; [eval] sorted(this.Nodes, null)
(push) ; 2
(assert (sorted%precondition ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(assert (sorted ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@42@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
  $Snap.unit))
; [eval] this.Nodes != null ==> segParent(this.Nodes, null) == null
; [eval] this.Nodes != null
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | First:($t@42@00) != Null | live]
; [else-branch: 43 | First:($t@42@00) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 43 | First:($t@42@00) != Null]
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null)))
; [eval] segParent(this.Nodes, null) == null
; [eval] segParent(this.Nodes, null)
(push) ; 4
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@42@00))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@42@00))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 43 | First:($t@42@00) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
  (and
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@42@00))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))))
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null)
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))))
(assert (=>
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
  (=
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@42@00)) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null)
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00)))))
  $Snap.unit))
; [eval] this.size == segSize(this.Nodes, null)
; [eval] segSize(this.Nodes, null)
(push) ; 2
(assert (segSize%precondition ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@42@00))))))
  (segSize ($Snap.first ($Snap.second $t@42@00)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@42@00)) $Ref.null)))
(pop) ; 1
