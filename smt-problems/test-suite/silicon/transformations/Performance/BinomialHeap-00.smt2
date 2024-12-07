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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
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
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  (= (treeParent%limited s@$ this@9@00) (treeParent s@$ this@9@00))
  :pattern ((treeParent s@$ this@9@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@9@00 $Ref)) (!
  (treeParent%stateless this@9@00)
  :pattern ((treeParent%limited s@$ this@9@00))
  :qid |quant-u-7|)))
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
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  (= (treeKey%limited s@$ this@17@00) (treeKey s@$ this@17@00))
  :pattern ((treeKey s@$ this@17@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@17@00 $Ref)) (!
  (treeKey%stateless this@17@00)
  :pattern ((treeKey%limited s@$ this@17@00))
  :qid |quant-u-13|)))
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
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (= (treeSize%limited s@$ this@22@00) (treeSize s@$ this@22@00))
  :pattern ((treeSize s@$ this@22@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@22@00 $Ref)) (!
  (treeSize%stateless this@22@00)
  :pattern ((treeSize%limited s@$ this@22@00))
  :qid |quant-u-17|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- reverse2 ----------
(declare-const this@0@01 $Ref)
(declare-const sibl@1@01 $Ref)
(declare-const res@2@01 $Ref)
(declare-const this@3@01 $Ref)
(declare-const sibl@4@01 $Ref)
(declare-const res@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] validChildren(this, null)
(push) ; 2
(assert (validChildren%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (validChildren%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(assert (validChildren ($Snap.first $t@6@01) this@3@01 $Ref.null))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] 0 < segLength(this, null)
; [eval] segLength(this, null)
(push) ; 2
(assert (segLength%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (segLength%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(assert (< 0 (segLength ($Snap.first $t@6@01) this@3@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= this@3@01 sibl@4@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  $Snap.unit))
; [eval] sorted(sibl, null)
(set-option :timeout 0)
(push) ; 2
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(pop) ; 2
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(assert (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
  $Snap.unit))
; [eval] sibl != null ==> segDegree(this, null, 0) < segDegree(sibl, null, 0)
; [eval] sibl != null
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= sibl@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= sibl@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | sibl@4@01 != Null | live]
; [else-branch: 0 | sibl@4@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | sibl@4@01 != Null]
(assert (not (= sibl@4@01 $Ref.null)))
; [eval] segDegree(this, null, 0) < segDegree(sibl, null, 0)
; [eval] segDegree(this, null, 0)
(push) ; 4
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 5
(pop) ; 5
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0))
(pop) ; 4
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@6@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0))
; [eval] segDegree(sibl, null, 0)
(push) ; 4
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 5
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(pop) ; 5
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(push) ; 5
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) sibl@4@01 $Ref.null 0))
(pop) ; 4
; Joined path conditions
(assert (and
  (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null)
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) sibl@4@01 $Ref.null 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | sibl@4@01 == Null]
(assert (= sibl@4@01 $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (and
    (not (= sibl@4@01 $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@6@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0)
    (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null)
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) sibl@4@01 $Ref.null 0))))
; Joined path conditions
(assert (or (= sibl@4@01 $Ref.null) (not (= sibl@4@01 $Ref.null))))
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (<
    (segDegree ($Snap.combine
      ($Snap.first $t@6@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) sibl@4@01 $Ref.null 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
  $Snap.unit))
; [eval] sibl != null ==> segParent(this, null) == segParent(sibl, null)
; [eval] sibl != null
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= sibl@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= sibl@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | sibl@4@01 != Null | live]
; [else-branch: 1 | sibl@4@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | sibl@4@01 != Null]
(assert (not (= sibl@4@01 $Ref.null)))
; [eval] segParent(this, null) == segParent(sibl, null)
; [eval] segParent(this, null)
(push) ; 4
; [eval] this != last
(push) ; 5
(assert (not (not (= this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (not (= this@3@01 $Ref.null)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= this@3@01 $Ref.null))
  (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)))
; [eval] segParent(sibl, null)
(push) ; 4
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 4
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | sibl@4@01 == Null]
(assert (= sibl@4@01 $Ref.null))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (and
    (not (= sibl@4@01 $Ref.null))
    (not (= this@3@01 $Ref.null))
    (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
; Joined path conditions
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (=
    (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] res != null
(assert (not (= res@5@01 $Ref.null)))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@01))) $Snap.unit))
; [eval] sorted(res, null)
(push) ; 3
(assert (sorted%precondition ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null))
(assert (sorted ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@7@01)))) $Snap.unit))
; [eval] segSize(res, null) == old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] segSize(res, null)
(push) ; 3
(assert (segSize%precondition ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null))
; [eval] old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] old(segSize(this, null))
; [eval] segSize(this, null)
(push) ; 3
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
; [eval] old(segSize(sibl, null))
; [eval] segSize(sibl, null)
(push) ; 3
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(assert (=
  (segSize ($Snap.first ($Snap.second $t@7@01)) res@5@01 $Ref.null)
  (+
    (segSize ($Snap.first $t@6@01) this@3@01 $Ref.null)
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@7@01))))
  $Snap.unit))
; [eval] segParent(res, null) == old(segParent(this, null))
; [eval] segParent(res, null)
(push) ; 3
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@7@01))
  $Snap.unit) res@5@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@7@01))
  $Snap.unit) res@5@01 $Ref.null))
; [eval] old(segParent(this, null))
; [eval] segParent(this, null)
(push) ; 3
; [eval] this != last
(push) ; 4
(assert (not (not (= this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= this@3@01 $Ref.null)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(pop) ; 3
; Joined path conditions
(assert (and
  (not (= this@3@01 $Ref.null))
  (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)))
(assert (=
  (segParent ($Snap.combine ($Snap.first ($Snap.second $t@7@01)) $Snap.unit) res@5@01 $Ref.null)
  (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(heapseg(this, null), write)
; [eval] this != last
(push) ; 3
(set-option :timeout 10)
(assert (not (= this@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | this@3@01 != Null | live]
; [else-branch: 2 | this@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | this@3@01 != Null]
(assert (not (= this@3@01 $Ref.null)))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  sibl@4@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 3 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 6
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
(pop) ; 6
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
; [eval] segParent(this.sibling, last)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01)))) $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01)))) $Ref.null))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01)))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (treeParent ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01)))) $Ref.null))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (heapseg%trigger ($Snap.first $t@6@01) this@3@01 $Ref.null))
; [eval] this.sibling != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 4 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; [exec]
; var ss: Ref
(declare-const ss@8@01 $Ref)
; [exec]
; ss := this.sibling
(declare-const ss@9@01 $Ref)
(assert (=
  ss@9@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))))
; [exec]
; this.sibling := sibl
; [exec]
; fold acc(heapseg(this, null), write)
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | this@3@01 != Null | live]
; [else-branch: 5 | this@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | this@3@01 != Null]
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= sibl@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= sibl@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | sibl@4@01 != Null | live]
; [else-branch: 6 | sibl@4@01 == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | sibl@4@01 != Null]
(assert (not (= sibl@4@01 $Ref.null)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | sibl@4@01 == Null]
(assert (= sibl@4@01 $Ref.null))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (and
    (not (= sibl@4@01 $Ref.null))
    (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
; Joined path conditions
(push) ; 6
(assert (not (=>
  (not (= sibl@4@01 $Ref.null))
  (=
    (treeParent ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (=
    (treeParent ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
(assert (heapseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  this@3@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; res := reverse2(ss, this)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] validChildren(this, null)
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
(set-option :timeout 0)
(push) ; 6
(assert (not (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
; [eval] 0 < segLength(this, null)
; [eval] segLength(this, null)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
(set-option :timeout 0)
(push) ; 6
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null)))
; [eval] sorted(sibl, null)
(push) ; 6
(assert (sorted%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (sorted%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(push) ; 6
(assert (not (sorted ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (sorted ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
; [eval] sibl != null ==> segDegree(this, null, 0) < segDegree(sibl, null, 0)
; [eval] sibl != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | this@3@01 != Null | live]
; [else-branch: 7 | this@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 7 | this@3@01 != Null]
; [eval] segDegree(this, null, 0) < segDegree(sibl, null, 0)
; [eval] segDegree(this, null, 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ss@9@01 $Ref.null 0))
(pop) ; 8
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ss@9@01 $Ref.null 0))
; [eval] segDegree(sibl, null, 0)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 9
(assert (segLength%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(pop) ; 9
; Joined path conditions
(assert (segLength%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(push) ; 9
(assert (not (<
  0
  (segLength ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit))) this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit))) this@3@01 $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit)))
  ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0))
(pop) ; 8
; Joined path conditions
(assert (and
  (segLength%precondition ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit))) this@3@01 $Ref.null)
  (<
    0
    (segLength ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit))) this@3@01 $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit)))
    ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= this@3@01 $Ref.null))
  (and
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ss@9@01 $Ref.null 0)
    (segLength%precondition ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit))) this@3@01 $Ref.null)
    (<
      0
      (segLength ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit))) this@3@01 $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0))))
(push) ; 6
(assert (not (=>
  (not (= this@3@01 $Ref.null))
  (<
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ss@9@01 $Ref.null 0)
    (segDegree ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= this@3@01 $Ref.null))
  (<
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ss@9@01 $Ref.null 0)
    (segDegree ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      ($Snap.combine $Snap.unit $Snap.unit)) this@3@01 $Ref.null 0))))
; [eval] sibl != null ==> segParent(this, null) == segParent(sibl, null)
; [eval] sibl != null
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | this@3@01 != Null | live]
; [else-branch: 8 | this@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 8 | this@3@01 != Null]
; [eval] segParent(this, null) == segParent(sibl, null)
; [eval] segParent(this, null)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] this != last
(set-option :timeout 0)
(push) ; 9
(assert (not (not (= ss@9@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (not (= ss@9@01 $Ref.null)))
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  $Snap.unit) ss@9@01 $Ref.null))
(pop) ; 8
; Joined path conditions
(assert (and
  (not (= ss@9@01 $Ref.null))
  (segParent%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    $Snap.unit) ss@9@01 $Ref.null)))
; [eval] segParent(sibl, null)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit)))
  $Snap.unit) this@3@01 $Ref.null))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit)))
  $Snap.unit) this@3@01 $Ref.null))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= this@3@01 $Ref.null))
  (and
    (not (= ss@9@01 $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit) ss@9@01 $Ref.null)
    (segParent%precondition ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      $Snap.unit) this@3@01 $Ref.null))))
(push) ; 6
(assert (not (=>
  (not (= this@3@01 $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit) ss@9@01 $Ref.null)
    (segParent ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      $Snap.unit) this@3@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= this@3@01 $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit) ss@9@01 $Ref.null)
    (segParent ($Snap.combine
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap sibl@4@01)
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
            $Snap.unit)))
      $Snap.unit) this@3@01 $Ref.null))))
(declare-const res@10@01 $Ref)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] res != null
(assert (not (= res@10@01 $Ref.null)))
(assert (=
  ($Snap.second $t@11@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@11@01))
    ($Snap.second ($Snap.second $t@11@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@11@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@11@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@11@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@11@01))) $Snap.unit))
; [eval] sorted(res, null)
(push) ; 6
(assert (sorted%precondition ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null))
(assert (sorted ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@11@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@11@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@11@01))))
  $Snap.unit))
; [eval] segSize(res, null) == old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] segSize(res, null)
(push) ; 6
(assert (segSize%precondition ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null))
; [eval] old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] old(segSize(this, null))
; [eval] segSize(this, null)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null))
; [eval] old(segSize(sibl, null))
; [eval] segSize(sibl, null)
(set-option :timeout 0)
(push) ; 6
(assert (segSize%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(assert (=
  (segSize ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null)
  (+
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) ss@9@01 $Ref.null)
    (segSize ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit))) this@3@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@11@01))))
  $Snap.unit))
; [eval] segParent(res, null) == old(segParent(this, null))
; [eval] segParent(res, null)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@11@01))
  $Snap.unit) res@10@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@11@01))
  $Snap.unit) res@10@01 $Ref.null))
; [eval] old(segParent(this, null))
; [eval] segParent(this, null)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= this@3@01 ss@9@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ss@9@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this != last
(set-option :timeout 0)
(push) ; 7
(assert (not (not (= ss@9@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= ss@9@01 $Ref.null)))
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  $Snap.unit) ss@9@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (and
  (not (= ss@9@01 $Ref.null))
  (segParent%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    $Snap.unit) ss@9@01 $Ref.null)))
(assert (=
  (segParent ($Snap.combine ($Snap.first ($Snap.second $t@11@01)) $Snap.unit) res@10@01 $Ref.null)
  (segParent ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    $Snap.unit) ss@9@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] res != null
; [eval] sorted(res, null)
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] segSize(res, null) == old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] segSize(res, null)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [eval] old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] old(segSize(this, null))
; [eval] segSize(this, null)
(push) ; 6
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
; [eval] old(segSize(sibl, null))
; [eval] segSize(sibl, null)
(push) ; 6
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(push) ; 6
(assert (not (=
  (segSize ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null)
  (+
    (segSize ($Snap.first $t@6@01) this@3@01 $Ref.null)
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (segSize ($Snap.first ($Snap.second $t@11@01)) res@10@01 $Ref.null)
  (+
    (segSize ($Snap.first $t@6@01) this@3@01 $Ref.null)
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))))
; [eval] segParent(res, null) == old(segParent(this, null))
; [eval] segParent(res, null)
(push) ; 6
; [eval] this != last
(pop) ; 6
; Joined path conditions
; [eval] old(segParent(this, null))
; [eval] segParent(this, null)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(push) ; 6
(assert (not (=
  (segParent ($Snap.combine ($Snap.first ($Snap.second $t@11@01)) $Snap.unit) res@10@01 $Ref.null)
  (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (segParent ($Snap.combine ($Snap.first ($Snap.second $t@11@01)) $Snap.unit) res@10@01 $Ref.null)
  (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 4 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(pop) ; 4
; [eval] !(this.sibling != null)
; [eval] this.sibling != null
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:($t@6@01))) == Null | live]
; [else-branch: 9 | First:(Second:(First:($t@6@01))) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
; [exec]
; res := this
; [exec]
; this.sibling := sibl
; [exec]
; fold acc(heapseg(res, null), write)
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= this@3@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | this@3@01 != Null | live]
; [else-branch: 10 | this@3@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | this@3@01 != Null]
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= sibl@4@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= sibl@4@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | sibl@4@01 != Null | live]
; [else-branch: 11 | sibl@4@01 == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 11 | sibl@4@01 != Null]
(assert (not (= sibl@4@01 $Ref.null)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  $Snap.unit) sibl@4@01 $Ref.null))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | sibl@4@01 == Null]
(assert (= sibl@4@01 $Ref.null))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (and
    (not (= sibl@4@01 $Ref.null))
    (treeParent%precondition ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
; Joined path conditions
(push) ; 6
(assert (not (=>
  (not (= sibl@4@01 $Ref.null))
  (=
    (treeParent ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (not (= sibl@4@01 $Ref.null))
  (=
    (treeParent ($Snap.first ($Snap.first $t@6@01)) this@3@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit) sibl@4@01 $Ref.null))))
(assert (heapseg%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  this@3@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] res != null
; [eval] sorted(res, null)
(set-option :timeout 0)
(push) ; 6
(assert (sorted%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (sorted%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(push) ; 6
(assert (not (sorted ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (sorted ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
; [eval] segSize(res, null) == old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] segSize(res, null)
(push) ; 6
(assert (segSize%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@6@01))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sibl@4@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
      $Snap.unit))) this@3@01 $Ref.null))
; [eval] old(segSize(this, null)) + old(segSize(sibl, null))
; [eval] old(segSize(this, null))
; [eval] segSize(this, null)
(push) ; 6
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@6@01) this@3@01 $Ref.null))
; [eval] old(segSize(sibl, null))
; [eval] segSize(sibl, null)
(push) ; 6
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))
(push) ; 6
(assert (not (=
  (segSize ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit))) this@3@01 $Ref.null)
  (+
    (segSize ($Snap.first $t@6@01) this@3@01 $Ref.null)
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (segSize ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit))) this@3@01 $Ref.null)
  (+
    (segSize ($Snap.first $t@6@01) this@3@01 $Ref.null)
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) sibl@4@01 $Ref.null))))
; [eval] segParent(res, null) == old(segParent(this, null))
; [eval] segParent(res, null)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit)))
  $Snap.unit) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sibl@4@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
        $Snap.unit)))
  $Snap.unit) this@3@01 $Ref.null))
; [eval] old(segParent(this, null))
; [eval] segParent(this, null)
(push) ; 6
; [eval] this != last
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(pop) ; 6
; Joined path conditions
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))
(push) ; 6
(assert (not (=
  (segParent ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit)))
    $Snap.unit) this@3@01 $Ref.null)
  (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  (segParent ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap sibl@4@01)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
          $Snap.unit)))
    $Snap.unit) this@3@01 $Ref.null)
  (segParent ($Snap.combine ($Snap.first $t@6@01) $Snap.unit) this@3@01 $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 9 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- concat ----------
(declare-const a@12@01 $Ref)
(declare-const b@13@01 $Ref)
(declare-const c@14@01 $Ref)
(declare-const a@15@01 $Ref)
(declare-const b@16@01 $Ref)
(declare-const c@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (and (= a@15@01 b@16@01) (= b@16@01 c@17@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@18@01))))))
; [eval] c != null
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= c@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= c@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | c@17@01 != Null | live]
; [else-branch: 12 | c@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 12 | c@17@01 != Null]
(assert (not (= c@17@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@18@01))) $Snap.unit))
; [eval] a != b && b != c ==> segParent(a, b) == segParent(b, c)
; [eval] a != b && b != c
; [eval] a != b
(push) ; 3
; [then-branch: 13 | a@15@01 == b@16@01 | live]
; [else-branch: 13 | a@15@01 != b@16@01 | live]
(push) ; 4
; [then-branch: 13 | a@15@01 == b@16@01]
(assert (= a@15@01 b@16@01))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | a@15@01 != b@16@01]
(assert (not (= a@15@01 b@16@01)))
; [eval] b != c
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@15@01 b@16@01)) (= a@15@01 b@16@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | a@15@01 != b@16@01 && b@16@01 != c@17@01 | live]
; [else-branch: 14 | !(a@15@01 != b@16@01 && b@16@01 != c@17@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | a@15@01 != b@16@01 && b@16@01 != c@17@01]
(assert (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01))))
; [eval] segParent(a, b) == segParent(b, c)
; [eval] segParent(a, b)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))
; [eval] segParent(b, c)
(push) ; 5
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 5
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(a@15@01 != b@16@01 && b@16@01 != c@17@01)]
(assert (not (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01)))
  (and
    (not (= a@15@01 b@16@01))
    (not (= b@16@01 c@17@01))
    (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      $Snap.unit) b@16@01 c@17@01))))
; Joined path conditions
(assert (or
  (not (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01))))
  (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01)))))
(assert (=>
  (and (not (= a@15@01 b@16@01)) (not (= b@16@01 c@17@01)))
  (=
    (segParent ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01)
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@18@01)) $Snap.unit) b@16@01 c@17@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] segLength(a, c) == old(segLength(a, b)) + old(segLength(b, c))
; [eval] segLength(a, c)
(push) ; 4
(assert (segLength%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 4
; Joined path conditions
(assert (segLength%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
; [eval] old(segLength(a, b)) + old(segLength(b, c))
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 4
(assert (segLength%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(pop) ; 4
; Joined path conditions
(assert (segLength%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
; [eval] old(segLength(b, c))
; [eval] segLength(b, c)
(push) ; 4
(assert (segLength%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 4
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(assert (=
  (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)
  (+
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] (forall i: Int :: { segDegree(a, c, i) } { old(segDegree(a, b, i)) } 0 <= i && i < old(segLength(a, b)) ==> segDegree(a, c, i) == old(segDegree(a, b, i)))
(declare-const i@20@01 Int)
(push) ; 4
; [eval] 0 <= i && i < old(segLength(a, b)) ==> segDegree(a, c, i) == old(segDegree(a, b, i))
; [eval] 0 <= i && i < old(segLength(a, b))
; [eval] 0 <= i
(push) ; 5
; [then-branch: 15 | !(0 <= i@20@01) | live]
; [else-branch: 15 | 0 <= i@20@01 | live]
(push) ; 6
; [then-branch: 15 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 15 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < old(segLength(a, b))
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(push) ; 5
; [then-branch: 16 | 0 <= i@20@01 && i@20@01 < segLength(First:($t@18@01), a@15@01, b@16@01) | live]
; [else-branch: 16 | !(0 <= i@20@01 && i@20@01 < segLength(First:($t@18@01), a@15@01, b@16@01)) | live]
(push) ; 6
; [then-branch: 16 | 0 <= i@20@01 && i@20@01 < segLength(First:($t@18@01), a@15@01, b@16@01)]
(assert (and
  (<= 0 i@20@01)
  (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
; [eval] segDegree(a, c, i) == old(segDegree(a, b, i))
; [eval] segDegree(a, c, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01)))
; [eval] old(segDegree(a, b, i))
; [eval] segDegree(a, b, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01))
(pop) ; 7
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(0 <= i@20@01 && i@20@01 < segLength(First:($t@18@01), a@15@01, b@16@01))]
(assert (not
  (and
    (<= 0 i@20@01)
    (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@20@01)
    (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
  (and
    (<= 0 i@20@01)
    (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01)
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@20@01)
      (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
  (and
    (<= 0 i@20@01)
    (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int)) (!
  (and
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01)))
    (or
      (not
        (and
          (<= 0 i@20@01)
          (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (and
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< i@20@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01)))
    (or
      (not
        (and
          (<= 0 i@20@01)
          (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110-aux|)))
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and
      (<= 0 i@20@01)
      (< i@20@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01)
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01)))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@20@01))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 i@20@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  $Snap.unit))
; [eval] (forall i: Int :: { segDegree(a, c, i) } old(segLength(a, b)) <= i && i < segLength(a, c) ==> segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b))))
(declare-const i@21@01 Int)
(push) ; 4
; [eval] old(segLength(a, b)) <= i && i < segLength(a, c) ==> segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b)))
; [eval] old(segLength(a, b)) <= i && i < segLength(a, c)
; [eval] old(segLength(a, b)) <= i
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 17 | !(segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01) | live]
; [else-branch: 17 | segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01 | live]
(push) ; 6
; [then-branch: 17 | !(segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01)]
(assert (not (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01]
(assert (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01))
; [eval] i < segLength(a, c)
; [eval] segLength(a, c)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
  (not (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01))))
(push) ; 5
; [then-branch: 18 | segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01 && i@21@01 < segLength(First:($t@19@01), a@15@01, c@17@01) | live]
; [else-branch: 18 | !(segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01 && i@21@01 < segLength(First:($t@19@01), a@15@01, c@17@01)) | live]
(push) ; 6
; [then-branch: 18 | segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01 && i@21@01 < segLength(First:($t@19@01), a@15@01, c@17@01)]
(assert (and
  (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
  (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))))
; [eval] segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b)))
; [eval] segDegree(a, c, i)
(push) ; 7
; [eval] 0 <= index
(push) ; 8
(assert (not (<= 0 i@21@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@21@01))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 8
(pop) ; 8
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@19@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<= 0 i@21@01)
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01)))
; [eval] old(segDegree(b, c, i - segLength(a, b)))
; [eval] segDegree(b, c, i - segLength(a, b))
; [eval] i - segLength(a, b)
; [eval] segLength(a, b)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
; [eval] 0 <= index
(push) ; 8
(assert (not (<= 0 (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
  i@21@01
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(pop) ; 7
; Joined path conditions
(assert (and
  (<= 0 (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
  (<
    (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
    i@21@01
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(segLength(First:($t@18@01), a@15@01, b@16@01) <= i@21@01 && i@21@01 < segLength(First:($t@19@01), a@15@01, c@17@01))]
(assert (not
  (and
    (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
    (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
    (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))
  (and
    (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
    (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
    (<= 0 i@21@01)
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@19@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01)
    (<= 0 (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
    (<
      (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
      i@21@01
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
      (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))))
  (and
    (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
    (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (or
      (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
      (not (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)))
    (=>
      (and
        (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
        (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))
      (and
        (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
        (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))
        (<= 0 i@21@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@19@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01)
        (<= 0 (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
        (<
          (- i@21@01 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
          i@21@01
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
    (or
      (not
        (and
          (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
          (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01))))
      (and
        (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
        (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@146@10@146@142-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (<= (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) i@21@01)
      (< i@21@01 (segLength ($Snap.first $t@19@01) a@15@01 c@17@01)))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@19@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
        i@21@01
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@19@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 c@17@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@146@10@146@142|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
; [eval] c != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= c@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | c@17@01 != Null | live]
; [else-branch: 19 | c@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | c@17@01 != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
; [eval] treeDegree(c) == old(treeDegree(c))
; [eval] treeDegree(c)
(push) ; 5
(assert (treeDegree%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
; [eval] old(treeDegree(c))
; [eval] treeDegree(c)
(push) ; 5
(assert (treeDegree%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeDegree ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01)
  (treeDegree ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  $Snap.unit))
; [eval] treeSize(c) == old(treeSize(c))
; [eval] treeSize(c)
(push) ; 5
(assert (treeSize%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeSize%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
; [eval] old(treeSize(c))
; [eval] treeSize(c)
(push) ; 5
(assert (treeSize%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeSize%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeSize ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01)
  (treeSize ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  $Snap.unit))
; [eval] treeParent(c) == old(treeParent(c))
; [eval] treeParent(c)
(push) ; 5
(assert (treeParent%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01))
; [eval] old(treeParent(c))
; [eval] treeParent(c)
(push) ; 5
(assert (treeParent%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 5
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeParent ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))) c@17@01)
  (treeParent ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  $Snap.unit))
; [eval] old(sorted(a, b)) && (old(sorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))) ==> sorted(a, c)
; [eval] old(sorted(a, b)) && (old(sorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] old(sorted(a, b))
; [eval] sorted(a, b)
(push) ; 5
(assert (sorted%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(pop) ; 5
; Joined path conditions
(assert (sorted%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(push) ; 5
; [then-branch: 20 | !(sorted(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 20 | sorted(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 6
; [then-branch: 20 | !(sorted(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 20 | sorted(First:($t@18@01), a@15@01, b@16@01)]
(assert (sorted ($Snap.first $t@18@01) a@15@01 b@16@01))
; [eval] old(sorted(b, c))
; [eval] sorted(b, c)
(push) ; 7
(assert (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 7
; [then-branch: 21 | !(sorted(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 21 | sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 8
; [then-branch: 21 | !(sorted(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | sorted(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 22 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 22 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 10
; [then-branch: 22 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 22 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01)]
(assert (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 23 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 23 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [eval] 0 <= index
(push) ; 12
(assert (not (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
  1)))
(pop) ; 11
; Joined path conditions
(assert (and
  (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
  (<
    (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    1))))
; [eval] segDegree(b, c, 0)
(push) ; 11
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 11
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 10
(push) ; 10
; [else-branch: 23 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
    (<
      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
        (<
          (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (or
      (not
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
            (<
              (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (or
          (not
            (and
              (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (not (sorted ($Snap.first $t@18@01) a@15@01 b@16@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | sorted(First:($t@18@01), a@15@01, b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
; [else-branch: 24 | !(sorted(First:($t@18@01), a@15@01, b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 24 | sorted(First:($t@18@01), a@15@01, b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (and
  (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
; [eval] sorted(a, c)
(push) ; 7
(assert (sorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (sorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | !(sorted(First:($t@18@01), a@15@01, b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (sorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
      (and
        (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (<
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(assert (=>
  (and
    (sorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
  (sorted ($Snap.first $t@19@01) a@15@01 c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
; [eval] old(presorted(a, b)) && (old(presorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))))) ==> presorted(a, c)
; [eval] old(presorted(a, b)) && (old(presorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))))
; [eval] old(presorted(a, b))
; [eval] presorted(a, b)
(push) ; 5
(assert (presorted%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(pop) ; 5
; Joined path conditions
(assert (presorted%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(push) ; 5
; [then-branch: 25 | !(presorted(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 25 | presorted(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 6
; [then-branch: 25 | !(presorted(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | presorted(First:($t@18@01), a@15@01, b@16@01)]
(assert (presorted ($Snap.first $t@18@01) a@15@01 b@16@01))
; [eval] old(presorted(b, c))
; [eval] presorted(b, c)
(push) ; 7
(assert (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 7
; [then-branch: 26 | !(presorted(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 26 | presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 8
; [then-branch: 26 | !(presorted(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 26 | presorted(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 27 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 27 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 10
; [then-branch: 27 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 27 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01)]
(assert (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 28 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 28 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [eval] 0 <= index
(push) ; 12
(assert (not (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
  1)))
(pop) ; 11
; Joined path conditions
(assert (and
  (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
  (<
    (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    1))))
; [eval] segDegree(b, c, 0)
(push) ; 11
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 11
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(push) ; 11
; [then-branch: 29 | !(segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
; [else-branch: 29 | segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
(push) ; 12
; [then-branch: 29 | !(segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (<=
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
(pop) ; 12
(push) ; 12
; [else-branch: 29 | segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (<=
  (segDegree ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    1))
  (segDegree ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
; [eval] 2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2)
; [eval] 2 <= segLength(a, b)
; [eval] segLength(a, b)
(push) ; 13
(pop) ; 13
; Joined path conditions
(push) ; 13
; [then-branch: 30 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 30 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 14
; [then-branch: 30 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(pop) ; 14
(push) ; 14
; [else-branch: 30 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01)]
(assert (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
; [eval] segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 16
(pop) ; 16
; Joined path conditions
(pop) ; 15
; Joined path conditions
; [eval] segDegree(a, b, segLength(a, b) - 2)
; [eval] segLength(a, b) - 2
; [eval] segLength(a, b)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [eval] 0 <= index
(push) ; 16
(assert (not (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
(assert (not (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(check-sat)
; unsat
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
  2)))
(pop) ; 15
; Joined path conditions
(assert (and
  (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
  (<
    (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    2))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (and
    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
    (<
      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      2)))))
(assert (or
  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(push) ; 13
(push) ; 14
(set-option :timeout 10)
(assert (not (not
  (and
    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        2)))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (and
  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      2))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) | live]
; [else-branch: 31 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2)) | live]
(set-option :timeout 0)
(push) ; 14
; [then-branch: 31 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2)]
(assert (and
  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      2)))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 16
(pop) ; 16
; Joined path conditions
(pop) ; 15
; Joined path conditions
; [eval] segDegree(b, c, 0)
(push) ; 15
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 16
(pop) ; 16
; Joined path conditions
(pop) ; 15
; Joined path conditions
(pop) ; 14
(push) ; 14
; [else-branch: 31 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2))]
(assert (not
  (and
    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        2))))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          2)))))
  (and
    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        2))))))
(push) ; 13
; [then-branch: 32 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
; [else-branch: 32 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
(push) ; 14
; [then-branch: 32 | !(2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (=>
    (and
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
(pop) ; 14
(push) ; 14
; [else-branch: 32 | 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (=>
  (and
    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        2))))
  (<
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; [eval] 2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1)
; [eval] 2 <= segLength(b, c)
; [eval] segLength(b, c)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
; [then-branch: 33 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 33 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 16
; [then-branch: 33 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 16
(push) ; 16
; [else-branch: 33 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
; [eval] segDegree(b, c, 0) == segDegree(b, c, 1)
; [eval] segDegree(b, c, 0)
(push) ; 17
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 18
(pop) ; 18
; Joined path conditions
(pop) ; 17
; Joined path conditions
; [eval] segDegree(b, c, 1)
(push) ; 17
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
(assert (not (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 18
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))
(pop) ; 17
; Joined path conditions
(assert (and
  (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
(assert (or
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (not (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(push) ; 15
(push) ; 16
(set-option :timeout 10)
(assert (not (not
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 16
(set-option :timeout 10)
(assert (not (and
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(check-sat)
; unknown
(pop) ; 16
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) | live]
; [else-branch: 34 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1)) | live]
(set-option :timeout 0)
(push) ; 16
; [then-branch: 34 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1)]
(assert (and
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 17
(pop) ; 17
; Joined path conditions
(push) ; 17
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 18
(pop) ; 18
; Joined path conditions
(pop) ; 17
; Joined path conditions
; [eval] segDegree(b, c, 0)
(push) ; 17
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 18
(pop) ; 18
; Joined path conditions
(pop) ; 17
; Joined path conditions
(pop) ; 16
(push) ; 16
; [else-branch: 34 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1))]
(assert (not
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(pop) ; 16
(pop) ; 15
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (=>
  (=>
    (and
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
  (and
    (=>
      (and
        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            2))))
      (<
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (=>
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (and
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
    (or
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (not
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
    (or
      (not
        (and
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
      (and
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))))
(assert (or
  (=>
    (and
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
  (not
    (=>
      (and
        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            2))))
      (<
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
  (and
    (<=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
    (=>
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (and
        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
        (<
          (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          2))))
    (or
      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
    (or
      (not
        (and
          (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              2)))))
      (and
        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            2)))))
    (=>
      (=>
        (and
          (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              2))))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
      (and
        (=>
          (and
            (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                2))))
          (<
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (=>
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<
              1
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
        (or
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (not
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
        (or
          (not
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
    (or
      (=>
        (and
          (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              2))))
        (<
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
      (not
        (=>
          (and
            (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                2))))
          (<
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
(assert (or
  (<=
    (segDegree ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
  (not
    (<=
      (segDegree ($Snap.combine
        ($Snap.first $t@18@01)
        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
(pop) ; 10
(push) ; 10
; [else-branch: 28 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
    (<
      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (=>
      (<=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (=>
          (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (and
            (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
            (<
              (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              2))))
        (or
          (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
        (or
          (not
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2)))))
          (and
            (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                2)))))
        (=>
          (=>
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (<
                  1
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (segDegree%precondition ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (or
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (not
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
            (or
              (not
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
        (or
          (=>
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (not
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
    (or
      (<=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
      (not
        (<=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
        (<
          (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
        (=>
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (<=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
            (=>
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
                (<
                  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (segDegree%precondition ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (or
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
            (or
              (not
                (and
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      2)))))
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2)))))
            (=>
              (=>
                (and
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (and
                (=>
                  (and
                    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        2))))
                  (<
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                (=>
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (<
                      1
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (segDegree%precondition ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                (or
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (not
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
                (or
                  (not
                    (and
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
            (or
              (=>
                (and
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (not
                (=>
                  (and
                    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        2))))
                  (<
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
        (or
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (not
            (<=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
    (or
      (not
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
            (<
              (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            (=>
              (<=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
              (and
                (<=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
                (=>
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (and
                    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                    (<=
                      0
                      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2))
                    (<
                      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 2)
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                    (segDegree%precondition ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      2))))
                (or
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (not (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
                (or
                  (not
                    (and
                      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          2)))))
                  (and
                    (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        2)))))
                (=>
                  (=>
                    (and
                      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          2))))
                    (<
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                  (and
                    (=>
                      (and
                        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first $t@18@01)
                            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                            1))
                          (segDegree ($Snap.combine
                            ($Snap.first $t@18@01)
                            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                            2))))
                      (<
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                    (=>
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (<
                          1
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (segDegree%precondition ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                    (or
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (not
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
                    (or
                      (not
                        (and
                          (<=
                            2
                            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                          (=
                            (segDegree ($Snap.combine
                              ($Snap.first ($Snap.second $t@18@01))
                              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                            (segDegree ($Snap.combine
                              ($Snap.first ($Snap.second $t@18@01))
                              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second $t@18@01))
                            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second $t@18@01))
                            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
                (or
                  (=>
                    (and
                      (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          2))))
                    (<
                      (segDegree ($Snap.combine
                        ($Snap.first $t@18@01)
                        ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                        (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                  (not
                    (=>
                      (and
                        (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first $t@18@01)
                            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                            1))
                          (segDegree ($Snap.combine
                            ($Snap.first $t@18@01)
                            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                            2))))
                      (<
                        (segDegree ($Snap.combine
                          ($Snap.first $t@18@01)
                          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
            (or
              (<=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
              (not
                (<=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
        (or
          (not
            (and
              (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (not (presorted ($Snap.first $t@18@01) a@15@01 b@16@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | presorted(First:($t@18@01), a@15@01, b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
; [else-branch: 35 | !(presorted(First:($t@18@01), a@15@01, b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 35 | presorted(First:($t@18@01), a@15@01, b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (and
  (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))
; [eval] presorted(a, c)
(push) ; 7
(assert (presorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (presorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 6
(push) ; 6
; [else-branch: 35 | !(presorted(First:($t@18@01), a@15@01, b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:($t@18@01), a@15@01, b@16@01) && segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 2) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
    (presorted%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
      (and
        (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (<=
              (segDegree ($Snap.combine
                ($Snap.first $t@18@01)
                ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
            (and
              (=>
                (and
                  (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first $t@18@01)
                      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (=>
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(assert (=>
  (and
    (presorted ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<= 2 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first $t@18@01)
                    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first $t@18@01)
                  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
                  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
  (presorted ($Snap.first $t@19@01) a@15@01 c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  $Snap.unit))
; [eval] old(validChildren(a, b)) && (old(validChildren(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1)) ==> validChildren(a, c)
; [eval] old(validChildren(a, b)) && (old(validChildren(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1))
; [eval] old(validChildren(a, b))
; [eval] validChildren(a, b)
(push) ; 5
(assert (validChildren%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(pop) ; 5
; Joined path conditions
(assert (validChildren%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(push) ; 5
; [then-branch: 36 | !(validChildren(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 36 | validChildren(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 6
; [then-branch: 36 | !(validChildren(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | validChildren(First:($t@18@01), a@15@01, b@16@01)]
(assert (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01))
; [eval] old(validChildren(b, c))
; [eval] validChildren(b, c)
(push) ; 7
(assert (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 7
; [then-branch: 37 | !(validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 37 | validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 8
; [then-branch: 37 | !(validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1)
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
; [then-branch: 38 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01)) | live]
; [else-branch: 38 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) | live]
(push) ; 10
; [then-branch: 38 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01))]
(assert (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 38 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01)]
(assert (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 11
(pop) ; 11
; Joined path conditions
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))))
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 39 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 39 | 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
; [eval] 0 <= index
(push) ; 12
(assert (not (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (<
  (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@18@01)
  ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
  (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
  1)))
(pop) ; 11
; Joined path conditions
(assert (and
  (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
  (<
    (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@18@01)
    ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
    (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
    1))))
; [eval] segDegree(b, c, 0) + 1
; [eval] segDegree(b, c, 0)
(push) ; 11
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 12
(pop) ; 12
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 11
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 10
(push) ; 10
; [else-branch: 39 | !(0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
    (<
      (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@18@01)
      ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
      (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
      (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
        (<
          (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (or
      (not
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (not (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))))
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<= 0 (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1))
            (<
              (- (segLength ($Snap.first $t@18@01) a@15@01 b@16@01) 1)
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (or
          (not
            (and
              (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
  (not (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | validChildren(First:($t@18@01), a@15@01, b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1 | live]
; [else-branch: 40 | !(validChildren(First:($t@18@01), a@15@01, b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 40 | validChildren(First:($t@18@01), a@15@01, b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1]
(assert (and
  (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1))))))
; [eval] validChildren(a, c)
(push) ; 7
(assert (validChildren%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (validChildren%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 6
(push) ; 6
; [else-branch: 40 | !(validChildren(First:($t@18@01), a@15@01, b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:($t@18@01), a@15@01, b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:($t@18@01), (_, _)), a@15@01, b@16@01, segLength(First:($t@18@01), a@15@01, b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1)]
(assert (not
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first $t@18@01)
          ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
          (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1)))
    (validChildren%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
      (and
        (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (=
            (segDegree ($Snap.combine
              ($Snap.first $t@18@01)
              ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
              (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
              1))
            (+
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
              1))))))
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))))
(assert (=>
  (and
    (validChildren ($Snap.first $t@18@01) a@15@01 b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (< 0 (segLength ($Snap.first $t@18@01) a@15@01 b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first $t@18@01)
            ($Snap.combine $Snap.unit $Snap.unit)) a@15@01 b@16@01 (-
            (segLength ($Snap.first $t@18@01) a@15@01 b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))
  (validChildren ($Snap.first $t@19@01) a@15@01 c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
  $Snap.unit))
; [eval] segSize(a, c) == old(segSize(a, b)) + old(segSize(b, c))
; [eval] segSize(a, c)
(push) ; 5
(assert (segSize%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
(pop) ; 5
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@19@01) a@15@01 c@17@01))
; [eval] old(segSize(a, b)) + old(segSize(b, c))
; [eval] old(segSize(a, b))
; [eval] segSize(a, b)
(push) ; 5
(assert (segSize%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
(pop) ; 5
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@18@01) a@15@01 b@16@01))
; [eval] old(segSize(b, c))
; [eval] segSize(b, c)
(push) ; 5
(assert (segSize%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 5
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(assert (=
  (segSize ($Snap.first $t@19@01) a@15@01 c@17@01)
  (+
    (segSize ($Snap.first $t@18@01) a@15@01 b@16@01)
    (segSize ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
  $Snap.unit))
; [eval] a != b ==> segParent(a, c) == old(segParent(a, b))
; [eval] a != b
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= a@15@01 b@16@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= a@15@01 b@16@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | a@15@01 != b@16@01 | live]
; [else-branch: 41 | a@15@01 == b@16@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 41 | a@15@01 != b@16@01]
(assert (not (= a@15@01 b@16@01)))
; [eval] segParent(a, c) == old(segParent(a, b))
; [eval] segParent(a, c)
(push) ; 7
; [eval] this != last
(push) ; 8
(assert (not (not (= a@15@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@15@01 c@17@01)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (not (= a@15@01 c@17@01))
  (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)))
; [eval] old(segParent(a, b))
; [eval] segParent(a, b)
(push) ; 7
; [eval] this != last
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))
(pop) ; 7
; Joined path conditions
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))
(pop) ; 6
(push) ; 6
; [else-branch: 41 | a@15@01 == b@16@01]
(assert (= a@15@01 b@16@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= a@15@01 b@16@01))
  (and
    (not (= a@15@01 b@16@01))
    (not (= a@15@01 c@17@01))
    (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)
    (segParent%precondition ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))))
; Joined path conditions
(assert (or (= a@15@01 b@16@01) (not (= a@15@01 b@16@01))))
(assert (=>
  (not (= a@15@01 b@16@01))
  (=
    (segParent ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)
    (segParent ($Snap.combine ($Snap.first $t@18@01) $Snap.unit) a@15@01 b@16@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))))))
  $Snap.unit))
; [eval] b != c ==> segParent(a, c) == old(segParent(b, c))
; [eval] b != c
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (= b@16@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= b@16@01 c@17@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | b@16@01 != c@17@01 | live]
; [else-branch: 42 | b@16@01 == c@17@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 42 | b@16@01 != c@17@01]
(assert (not (= b@16@01 c@17@01)))
; [eval] segParent(a, c) == old(segParent(b, c))
; [eval] segParent(a, c)
(push) ; 7
; [eval] this != last
(push) ; 8
(assert (not (not (= a@15@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@15@01 c@17@01)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (not (= a@15@01 c@17@01))
  (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)))
; [eval] old(segParent(b, c))
; [eval] segParent(b, c)
(push) ; 7
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 6
(push) ; 6
; [else-branch: 42 | b@16@01 == c@17@01]
(assert (= b@16@01 c@17@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= b@16@01 c@17@01))
  (and
    (not (= b@16@01 c@17@01))
    (not (= a@15@01 c@17@01))
    (segParent%precondition ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      $Snap.unit) b@16@01 c@17@01))))
; Joined path conditions
(assert (or (= b@16@01 c@17@01) (not (= b@16@01 c@17@01))))
(assert (=>
  (not (= b@16@01 c@17@01))
  (=
    (segParent ($Snap.combine ($Snap.first $t@19@01) $Snap.unit) a@15@01 c@17@01)
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@18@01)) $Snap.unit) b@16@01 c@17@01))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [eval] a != b
(push) ; 4
(set-option :timeout 10)
(assert (not (= a@15@01 b@16@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= a@15@01 b@16@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | a@15@01 != b@16@01 | live]
; [else-branch: 43 | a@15@01 == b@16@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 43 | a@15@01 != b@16@01]
(assert (not (= a@15@01 b@16@01)))
; [exec]
; unfold acc(heapseg(a, b), write)
; [eval] this != last
(push) ; 5
(set-option :timeout 10)
(assert (not (= a@15@01 b@16@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | a@15@01 != b@16@01 | live]
; [else-branch: 44 | a@15@01 == b@16@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 44 | a@15@01 != b@16@01]
(assert (=
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@18@01))
    ($Snap.second ($Snap.first $t@18@01)))))
(push) ; 6
(set-option :timeout 10)
(assert (not (= c@17@01 a@15@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@18@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@18@01))))))
(assert (not (= a@15@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@18@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@18@01)))))))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and
  (=
    b@16@01
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))))
  (= c@17@01 b@16@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit))
; [eval] this.sibling != last ==> treeParent(this) == segParent(this.sibling, last)
; [eval] this.sibling != last
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
  b@16@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(First:($t@18@01))) != b@16@01 | live]
; [else-branch: 45 | First:(Second:(First:($t@18@01))) == b@16@01 | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 45 | First:(Second:(First:($t@18@01))) != b@16@01]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01)))
; [eval] treeParent(this) == segParent(this.sibling, last)
; [eval] treeParent(this)
(push) ; 8
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@18@01)) a@15@01))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first $t@18@01)) a@15@01))
; [eval] segParent(this.sibling, last)
(push) ; 8
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 8
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 7
(push) ; 7
; [else-branch: 45 | First:(Second:(First:($t@18@01))) == b@16@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
  b@16@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (treeParent%precondition ($Snap.first ($Snap.first $t@18@01)) a@15@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (=
    (treeParent ($Snap.first ($Snap.first $t@18@01)) a@15@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (heapseg%trigger ($Snap.first $t@18@01) a@15@01 b@16@01))
; [exec]
; concat(a.sibling, b, c)
; [eval] c != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= c@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | c@17@01 != Null | live]
; [else-branch: 46 | c@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 46 | c@17@01 != Null]
; [eval] a != b && b != c ==> segParent(a, b) == segParent(b, c)
; [eval] a != b && b != c
; [eval] a != b
(push) ; 7
; [then-branch: 47 | First:(Second:(First:($t@18@01))) == b@16@01 | live]
; [else-branch: 47 | First:(Second:(First:($t@18@01))) != b@16@01 | live]
(push) ; 8
; [then-branch: 47 | First:(Second:(First:($t@18@01))) == b@16@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
  b@16@01))
(pop) ; 8
(push) ; 8
; [else-branch: 47 | First:(Second:(First:($t@18@01))) != b@16@01]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01)))
; [eval] b != c
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01)))
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (not (= b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(First:($t@18@01))) != b@16@01 && b@16@01 != c@17@01 | live]
; [else-branch: 48 | !(First:(Second:(First:($t@18@01))) != b@16@01 && b@16@01 != c@17@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 48 | First:(Second:(First:($t@18@01))) != b@16@01 && b@16@01 != c@17@01]
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (not (= b@16@01 c@17@01))))
; [eval] segParent(a, b) == segParent(b, c)
; [eval] segParent(a, b)
(push) ; 9
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 9
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] segParent(b, c)
(push) ; 9
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 9
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 8
(push) ; 8
; [else-branch: 48 | !(First:(Second:(First:($t@18@01))) != b@16@01 && b@16@01 != c@17@01)]
(assert (not
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      $Snap.unit) b@16@01 c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
          b@16@01))
      (not (= b@16@01 c@17@01))))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01)))))
(push) ; 7
(assert (not (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01)))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@18@01)) $Snap.unit) b@16@01 c@17@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not (= b@16@01 c@17@01)))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@18@01)) $Snap.unit) b@16@01 c@17@01))))
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (=
  ($Snap.second $t@22@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@22@01))
    ($Snap.second ($Snap.second $t@22@01)))))
(assert (= ($Snap.first ($Snap.second $t@22@01)) $Snap.unit))
; [eval] segLength(a, c) == old(segLength(a, b)) + old(segLength(b, c))
; [eval] segLength(a, c)
(push) ; 7
(assert (segLength%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
; [eval] old(segLength(a, b)) + old(segLength(b, c))
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] old(segLength(b, c))
; [eval] segLength(b, c)
(push) ; 7
(assert (segLength%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 7
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(assert (=
  (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
  (+
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(assert (=
  ($Snap.second ($Snap.second $t@22@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@22@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@22@01))) $Snap.unit))
; [eval] (forall i: Int :: { segDegree(a, c, i) } { old(segDegree(a, b, i)) } 0 <= i && i < old(segLength(a, b)) ==> segDegree(a, c, i) == old(segDegree(a, b, i)))
(declare-const i@23@01 Int)
(push) ; 7
; [eval] 0 <= i && i < old(segLength(a, b)) ==> segDegree(a, c, i) == old(segDegree(a, b, i))
; [eval] 0 <= i && i < old(segLength(a, b))
; [eval] 0 <= i
(push) ; 8
; [then-branch: 49 | !(0 <= i@23@01) | live]
; [else-branch: 49 | 0 <= i@23@01 | live]
(push) ; 9
; [then-branch: 49 | !(0 <= i@23@01)]
(assert (not (<= 0 i@23@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 49 | 0 <= i@23@01]
(assert (<= 0 i@23@01))
; [eval] i < old(segLength(a, b))
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
(push) ; 8
; [then-branch: 50 | 0 <= i@23@01 && i@23@01 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
; [else-branch: 50 | !(0 <= i@23@01 && i@23@01 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
(push) ; 9
; [then-branch: 50 | 0 <= i@23@01 && i@23@01 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (and
  (<= 0 i@23@01)
  (<
    i@23@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
; [eval] segDegree(a, c, i) == old(segDegree(a, b, i))
; [eval] segDegree(a, c, i)
(push) ; 10
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (<
  i@23@01
  (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<
  i@23@01
  (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (<
    i@23@01
    (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01)))
; [eval] old(segDegree(a, b, i))
; [eval] segDegree(a, b, i)
(push) ; 10
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01))
(pop) ; 10
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01))
(pop) ; 9
(push) ; 9
; [else-branch: 50 | !(0 <= i@23@01 && i@23@01 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (<
      i@23@01
      (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01)
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
  (and
    (<= 0 i@23@01)
    (<
      i@23@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@23@01 Int)) (!
  (and
    (or (<= 0 i@23@01) (not (<= 0 i@23@01)))
    (=>
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (<
          i@23@01
          (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@22@01)
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01)))
    (or
      (not
        (and
          (<= 0 i@23@01)
          (<
            i@23@01
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110-aux|)))
(assert (forall ((i@23@01 Int)) (!
  (and
    (or (<= 0 i@23@01) (not (<= 0 i@23@01)))
    (=>
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (<
          i@23@01
          (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@22@01)
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01)))
    (or
      (not
        (and
          (<= 0 i@23@01)
          (<
            i@23@01
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
      (and
        (<= 0 i@23@01)
        (<
          i@23@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110-aux|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@22@01)
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01)))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@23@01))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 i@23@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@145@10@145@110|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@22@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  $Snap.unit))
; [eval] (forall i: Int :: { segDegree(a, c, i) } old(segLength(a, b)) <= i && i < segLength(a, c) ==> segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b))))
(declare-const i@24@01 Int)
(push) ; 7
; [eval] old(segLength(a, b)) <= i && i < segLength(a, c) ==> segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b)))
; [eval] old(segLength(a, b)) <= i && i < segLength(a, c)
; [eval] old(segLength(a, b)) <= i
; [eval] old(segLength(a, b))
; [eval] segLength(a, b)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
; [then-branch: 51 | !(segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01) | live]
; [else-branch: 51 | segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01 | live]
(push) ; 9
; [then-branch: 51 | !(segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01)]
(assert (not
  (<=
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    i@24@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 51 | segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01]
(assert (<=
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  i@24@01))
; [eval] i < segLength(a, c)
; [eval] segLength(a, c)
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    i@24@01)
  (not
    (<=
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      i@24@01))))
(push) ; 8
; [then-branch: 52 | segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01 && i@24@01 < segLength(First:($t@22@01), First:(Second:(First:($t@18@01))), c@17@01) | live]
; [else-branch: 52 | !(segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01 && i@24@01 < segLength(First:($t@22@01), First:(Second:(First:($t@18@01))), c@17@01)) | live]
(push) ; 9
; [then-branch: 52 | segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01 && i@24@01 < segLength(First:($t@22@01), First:(Second:(First:($t@18@01))), c@17@01)]
(assert (and
  (<=
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    i@24@01)
  (<
    i@24@01
    (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
; [eval] segDegree(a, c, i) == old(segDegree(b, c, i - segLength(a, b)))
; [eval] segDegree(a, c, i)
(push) ; 10
; [eval] 0 <= index
(push) ; 11
(assert (not (<= 0 i@24@01)))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@24@01))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 11
(pop) ; 11
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first $t@22@01)
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (<= 0 i@24@01)
  (segDegree%precondition ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01)))
; [eval] old(segDegree(b, c, i - segLength(a, b)))
; [eval] segDegree(b, c, i - segLength(a, b))
; [eval] i - segLength(a, b)
; [eval] segLength(a, b)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
; [eval] 0 <= index
(push) ; 11
(assert (not (<=
  0
  (-
    i@24@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    i@24@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (<
  (-
    i@24@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    i@24@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
  i@24@01
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(pop) ; 10
; Joined path conditions
(assert (and
  (<=
    0
    (-
      i@24@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
  (<
    (-
      i@24@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
    i@24@01
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(pop) ; 9
(push) ; 9
; [else-branch: 52 | !(segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) <= i@24@01 && i@24@01 < segLength(First:($t@22@01), First:(Second:(First:($t@18@01))), c@17@01))]
(assert (not
  (and
    (<=
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      i@24@01)
    (<
      i@24@01
      (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (<=
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      i@24@01)
    (<
      i@24@01
      (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
  (and
    (<=
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      i@24@01)
    (<
      i@24@01
      (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
    (<= 0 i@24@01)
    (segDegree%precondition ($Snap.combine
      ($Snap.first $t@22@01)
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01)
    (<=
      0
      (-
        i@24@01
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
    (<
      (-
        i@24@01
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
      i@24@01
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        i@24@01)
      (<
        i@24@01
        (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
  (and
    (<=
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      i@24@01)
    (<
      i@24@01
      (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int)) (!
  (and
    (or
      (<=
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        i@24@01)
      (not
        (<=
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          i@24@01)))
    (=>
      (and
        (<=
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          i@24@01)
        (<
          i@24@01
          (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
      (and
        (<=
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          i@24@01)
        (<
          i@24@01
          (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
        (<= 0 i@24@01)
        (segDegree%precondition ($Snap.combine
          ($Snap.first $t@22@01)
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01)
        (<=
          0
          (-
            i@24@01
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
        (<
          (-
            i@24@01
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
          i@24@01
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
    (or
      (not
        (and
          (<=
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            i@24@01)
          (<
            i@24@01
            (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
      (and
        (<=
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          i@24@01)
        (<
          i@24@01
          (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@146@10@146@142-aux|)))
(assert (forall ((i@24@01 Int)) (!
  (=>
    (and
      (<=
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        i@24@01)
      (<
        i@24@01
        (segLength ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
    (=
      (segDegree ($Snap.combine
        ($Snap.first $t@22@01)
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 (-
        i@24@01
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
  :pattern ((segDegree%limited ($Snap.combine
    ($Snap.first $t@22@01)
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01 i@24@01))
  :qid |prog./silicon/silver/src/test/resources/transformations/Performance/BinomialHeap.vpr@146@10@146@142|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
; [eval] c != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= c@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | c@17@01 != Null | live]
; [else-branch: 53 | c@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 53 | c@17@01 != Null]
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (= a@15@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  $Snap.unit))
; [eval] treeDegree(c) == old(treeDegree(c))
; [eval] treeDegree(c)
(set-option :timeout 0)
(push) ; 8
(assert (treeDegree%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
; [eval] old(treeDegree(c))
; [eval] treeDegree(c)
(push) ; 8
(assert (treeDegree%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeDegree%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeDegree ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01)
  (treeDegree ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; [eval] treeSize(c) == old(treeSize(c))
; [eval] treeSize(c)
(push) ; 8
(assert (treeSize%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeSize%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
; [eval] old(treeSize(c))
; [eval] treeSize(c)
(push) ; 8
(assert (treeSize%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeSize%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeSize ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01)
  (treeSize ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; [eval] treeParent(c) == old(treeParent(c))
; [eval] treeParent(c)
(push) ; 8
(assert (treeParent%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
; [eval] old(treeParent(c))
; [eval] treeParent(c)
(push) ; 8
(assert (treeParent%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (treeParent%precondition ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01))
(assert (=
  (treeParent ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01)
  (treeParent ($Snap.first ($Snap.second ($Snap.second $t@18@01))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  $Snap.unit))
; [eval] old(sorted(a, b)) && (old(sorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))) ==> sorted(a, c)
; [eval] old(sorted(a, b)) && (old(sorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] old(sorted(a, b))
; [eval] sorted(a, b)
(push) ; 8
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 8
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(push) ; 8
; [then-branch: 54 | !(sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 54 | sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 9
; [then-branch: 54 | !(sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 54 | sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] old(sorted(b, c))
; [eval] sorted(b, c)
(push) ; 10
(assert (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 10
; Joined path conditions
(assert (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 10
; [then-branch: 55 | !(sorted(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 55 | sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 11
; [then-branch: 55 | !(sorted(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 55 | sorted(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 56 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 56 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 13
; [then-branch: 56 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 56 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 14
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (not
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 57 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 57 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [eval] 0 <= index
(push) ; 15
(assert (not (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  1)))
(pop) ; 14
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
  (<
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1)
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
; [eval] segDegree(b, c, 0)
(push) ; 14
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 14
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 13
(push) ; 13
; [else-branch: 57 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<=
      0
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
    (<
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1)
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (not
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<=
          0
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
        (<
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1)
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (or
      (not
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (sorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (not
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<=
              0
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
            (<
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1)
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (or
          (not
            (and
              (<
                0
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (not
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
; [else-branch: 58 | !(sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 58 | sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (and
  (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
; [eval] sorted(a, c)
(push) ; 10
(assert (sorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 10
; Joined path conditions
(assert (sorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 9
(push) ; 9
; [else-branch: 58 | !(sorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && sorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (<
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (sorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      (and
        (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (<
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
(assert (=>
  (and
    (sorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (sorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
  (sorted ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  $Snap.unit))
; [eval] old(presorted(a, b)) && (old(presorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))))) ==> presorted(a, c)
; [eval] old(presorted(a, b)) && (old(presorted(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))))
; [eval] old(presorted(a, b))
; [eval] presorted(a, b)
(push) ; 8
(assert (presorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 8
; Joined path conditions
(assert (presorted%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(push) ; 8
; [then-branch: 59 | !(presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 59 | presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 9
; [then-branch: 59 | !(presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 59 | presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] old(presorted(b, c))
; [eval] presorted(b, c)
(push) ; 10
(assert (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 10
; Joined path conditions
(assert (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 10
; [then-branch: 60 | !(presorted(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 60 | presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 11
; [then-branch: 60 | !(presorted(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 60 | presorted(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0))))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 61 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 61 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 13
; [then-branch: 61 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 61 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 14
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (not
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 62 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 62 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0) && ((2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)) && (2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)))
; [eval] segDegree(a, b, segLength(a, b) - 1) <= segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [eval] 0 <= index
(push) ; 15
(assert (not (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  1)))
(pop) ; 14
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
  (<
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1)
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
; [eval] segDegree(b, c, 0)
(push) ; 14
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 14
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(push) ; 14
; [then-branch: 63 | !(segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
; [else-branch: 63 | segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
(push) ; 15
; [then-branch: 63 | !(segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (<=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
(pop) ; 15
(push) ; 15
; [else-branch: 63 | segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (<=
  (segDegree ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))
  (segDegree ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
; [eval] 2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 2 <= segLength(a, b) && segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2)
; [eval] 2 <= segLength(a, b)
; [eval] segLength(a, b)
(push) ; 16
(pop) ; 16
; Joined path conditions
(push) ; 16
; [then-branch: 64 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 64 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 17
; [then-branch: 64 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (<=
    2
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(pop) ; 17
(push) ; 17
; [else-branch: 64 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (<=
  2
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
; [eval] segDegree(a, b, segLength(a, b) - 1) == segDegree(a, b, segLength(a, b) - 2)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 19
(pop) ; 19
; Joined path conditions
(pop) ; 18
; Joined path conditions
; [eval] segDegree(a, b, segLength(a, b) - 2)
; [eval] segLength(a, b) - 2
; [eval] segLength(a, b)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [eval] 0 <= index
(push) ; 19
(assert (not (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    2))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    2)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 19
(pop) ; 19
; Joined path conditions
(push) ; 19
(assert (not (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    2)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(check-sat)
; unsat
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    2)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  2)))
(pop) ; 18
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      2))
  (<
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      2)
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    2))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    2
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (and
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (<=
      0
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2))
    (<
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2)
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      2)))))
(assert (or
  (<=
    2
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (not
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(push) ; 16
(push) ; 17
(set-option :timeout 10)
(assert (not (not
  (and
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2)))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 17
(set-option :timeout 10)
(assert (not (and
  (<=
    2
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      2))))))
(check-sat)
; unknown
(pop) ; 17
; 0,00s
; (get-info :all-statistics)
; [then-branch: 65 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) | live]
; [else-branch: 65 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2)) | live]
(set-option :timeout 0)
(push) ; 17
; [then-branch: 65 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2)]
(assert (and
  (<=
    2
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      2)))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 19
(pop) ; 19
; Joined path conditions
(pop) ; 18
; Joined path conditions
; [eval] segDegree(b, c, 0)
(push) ; 18
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 19
(pop) ; 19
; Joined path conditions
(pop) ; 18
; Joined path conditions
(pop) ; 17
(push) ; 17
; [else-branch: 65 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2))]
(assert (not
  (and
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2))))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          2)))))
  (and
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2))))))
(push) ; 16
; [then-branch: 66 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
; [else-branch: 66 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
(push) ; 17
; [then-branch: 66 | !(2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (=>
    (and
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
(pop) ; 17
(push) ; 17
; [else-branch: 66 | 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (=>
  (and
    (<=
      2
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        2))))
  (<
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; [eval] 2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1) ==> segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] 2 <= segLength(b, c) && segDegree(b, c, 0) == segDegree(b, c, 1)
; [eval] 2 <= segLength(b, c)
; [eval] segLength(b, c)
(push) ; 18
(pop) ; 18
; Joined path conditions
(push) ; 18
; [then-branch: 67 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 67 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 19
; [then-branch: 67 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 19
(push) ; 19
; [else-branch: 67 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
; [eval] segDegree(b, c, 0) == segDegree(b, c, 1)
; [eval] segDegree(b, c, 0)
(push) ; 20
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 21
(pop) ; 21
; Joined path conditions
(pop) ; 20
; Joined path conditions
; [eval] segDegree(b, c, 1)
(push) ; 20
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(check-sat)
; unsat
(pop) ; 21
; 0,00s
; (get-info :all-statistics)
(assert (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))
(pop) ; 20
; Joined path conditions
(assert (and
  (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
(assert (or
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (not (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(push) ; 18
(push) ; 19
(set-option :timeout 10)
(assert (not (not
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 19
(set-option :timeout 10)
(assert (not (and
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(check-sat)
; unknown
(pop) ; 19
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) | live]
; [else-branch: 68 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1)) | live]
(set-option :timeout 0)
(push) ; 19
; [then-branch: 68 | 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1)]
(assert (and
  (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
; [eval] segDegree(a, b, segLength(a, b) - 1) < segDegree(b, c, 0)
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 20
(pop) ; 20
; Joined path conditions
(push) ; 20
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 21
(pop) ; 21
; Joined path conditions
(pop) ; 20
; Joined path conditions
; [eval] segDegree(b, c, 0)
(push) ; 20
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 21
(pop) ; 21
; Joined path conditions
(pop) ; 20
; Joined path conditions
(pop) ; 19
(push) ; 19
; [else-branch: 68 | !(2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1))]
(assert (not
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
  (and
    (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (=>
    (and
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
  (and
    (=>
      (and
        (<=
          2
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            2))))
      (<
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (=>
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (and
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (< 1 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
    (or
      (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
      (not
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
    (or
      (not
        (and
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
      (and
        (<= 2 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))))))
(assert (or
  (=>
    (and
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          2))))
    (<
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
  (not
    (=>
      (and
        (<=
          2
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            2))))
      (<
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
  (and
    (<=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
    (=>
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (and
        (<=
          2
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (<=
          0
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            2))
        (<
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            2)
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          2))))
    (or
      (<=
        2
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (not
        (<=
          2
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
    (or
      (not
        (and
          (<=
            2
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              2)))))
      (and
        (<=
          2
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            2)))))
    (=>
      (=>
        (and
          (<=
            2
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              2))))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
      (and
        (=>
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                2))))
          (<
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (=>
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<
              1
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
        (or
          (<=
            2
            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
          (not
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
        (or
          (not
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
    (or
      (=>
        (and
          (<=
            2
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              2))))
        (<
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
      (not
        (=>
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                2))))
          (<
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
(assert (or
  (<=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
  (not
    (<=
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
      (segDegree ($Snap.combine
        ($Snap.first ($Snap.second $t@18@01))
        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))
(pop) ; 13
(push) ; 13
; [else-branch: 62 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<=
      0
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
    (<
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1)
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
    (=>
      (<=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (=>
          (<=
            2
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<=
              0
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                2))
            (<
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                2)
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              2))))
        (or
          (<=
            2
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (not
            (<=
              2
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
        (or
          (not
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2)))))
          (and
            (<=
              2
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                2)))))
        (=>
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (<
                  1
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (segDegree%precondition ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (or
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (not
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
            (or
              (not
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
        (or
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (not
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
    (or
      (<=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
      (not
        (<=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (not
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<=
          0
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
        (<
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1)
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
        (=>
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (<=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
            (=>
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (<=
                  0
                  (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))
                (<
                  (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2)
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (segDegree%precondition ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (or
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (not
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
            (or
              (not
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      2)))))
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2)))))
            (=>
              (=>
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (and
                (=>
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        2))))
                  (<
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                (=>
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (<
                      1
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (segDegree%precondition ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                (or
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (not
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
                (or
                  (not
                    (and
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
            (or
              (=>
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (not
                (=>
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        2))))
                  (<
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
        (or
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (not
            (<=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
    (or
      (not
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (presorted%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (not
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<=
              0
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
            (<
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1)
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            (=>
              (<=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
              (and
                (<=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
                (=>
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                    (<=
                      0
                      (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        2))
                    (<
                      (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        2)
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                    (segDegree%precondition ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      2))))
                (or
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (not
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
                (or
                  (not
                    (and
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          2)))))
                  (and
                    (<=
                      2
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                    (=
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        2)))))
                (=>
                  (=>
                    (and
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          2))))
                    (<
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                  (and
                    (=>
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                            1))
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                            2))))
                      (<
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                    (=>
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (<
                          1
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (segDegree%precondition ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                    (or
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                      (not
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
                    (or
                      (not
                        (and
                          (<=
                            2
                            (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                          (=
                            (segDegree ($Snap.combine
                              ($Snap.first ($Snap.second $t@18@01))
                              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                            (segDegree ($Snap.combine
                              ($Snap.first ($Snap.second $t@18@01))
                              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second $t@18@01))
                            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second $t@18@01))
                            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1))))))
                (or
                  (=>
                    (and
                      (<=
                        2
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                      (=
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          2))))
                    (<
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                        ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                        1))
                      (segDegree ($Snap.combine
                        ($Snap.first ($Snap.second $t@18@01))
                        ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
                  (not
                    (=>
                      (and
                        (<=
                          2
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                        (=
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                            1))
                          (segDegree ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                            2))))
                      (<
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                          1))
                        (segDegree ($Snap.combine
                          ($Snap.first ($Snap.second $t@18@01))
                          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))
            (or
              (<=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
              (not
                (<=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
        (or
          (not
            (and
              (<
                0
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (not
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 69 | presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) | live]
; [else-branch: 69 | !(presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 69 | presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0)]
(assert (and
  (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))
; [eval] presorted(a, c)
(push) ; 10
(assert (presorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 10
; Joined path conditions
(assert (presorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 9
(push) ; 9
; [else-branch: 69 | !(presorted(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && presorted(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) <= segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 2) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) && 2 <= segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) && segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 1) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) < segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0))]
(assert (not
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
        (and
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  2))))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
          (=>
            (and
              (<=
                2
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
              (=
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
            (<
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))
    (presorted%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      (and
        (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (<=
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
            (and
              (=>
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      1))
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                      2))))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
              (=>
                (and
                  (<=
                    2
                    (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                  (=
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                    (segDegree ($Snap.combine
                      ($Snap.first ($Snap.second $t@18@01))
                      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
                (<
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))))))))
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))))
(assert (=>
  (and
    (presorted ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (presorted ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (and
          (<=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
          (and
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    1))
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                    2))))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
            (=>
              (and
                (<=
                  2
                  (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
                (=
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
                  (segDegree ($Snap.combine
                    ($Snap.first ($Snap.second $t@18@01))
                    ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 1)))
              (<
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
                  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
                  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                  1))
                (segDegree ($Snap.combine
                  ($Snap.first ($Snap.second $t@18@01))
                  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))))))
  (presorted ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  $Snap.unit))
; [eval] old(validChildren(a, b)) && (old(validChildren(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1)) ==> validChildren(a, c)
; [eval] old(validChildren(a, b)) && (old(validChildren(b, c)) && old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1))
; [eval] old(validChildren(a, b))
; [eval] validChildren(a, b)
(push) ; 8
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 8
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(push) ; 8
; [then-branch: 70 | !(validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 70 | validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 9
; [then-branch: 70 | !(validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 70 | validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] old(validChildren(b, c))
; [eval] validChildren(b, c)
(push) ; 10
(assert (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 10
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(push) ; 10
; [then-branch: 71 | !(validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
; [else-branch: 71 | validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
(push) ; 11
; [then-branch: 71 | !(validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 71 | validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
; [eval] old(0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1)
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c) ==> segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1
; [eval] 0 < segLength(a, b) && 0 < segLength(b, c)
; [eval] 0 < segLength(a, b)
; [eval] segLength(a, b)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
; [then-branch: 72 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)) | live]
; [else-branch: 72 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) | live]
(push) ; 13
; [then-branch: 72 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01))]
(assert (not
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 72 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01)]
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
; [eval] 0 < segLength(b, c)
; [eval] segLength(b, c)
(push) ; 14
(pop) ; 14
; Joined path conditions
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (not
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))))
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 73 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) | live]
; [else-branch: 73 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)) | live]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 73 | 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01)]
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
; [eval] segDegree(a, b, segLength(a, b) - 1) == segDegree(b, c, 0) + 1
; [eval] segDegree(a, b, segLength(a, b) - 1)
; [eval] segLength(a, b) - 1
; [eval] segLength(a, b)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
; [eval] 0 <= index
(push) ; 15
(assert (not (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)))
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(push) ; 15
(assert (not (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(check-sat)
; unsat
(pop) ; 15
; 0,00s
; (get-info :all-statistics)
(assert (<
  (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1)
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  1)))
(pop) ; 14
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
  (<
    (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1)
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    1))))
; [eval] segDegree(b, c, 0) + 1
; [eval] segDegree(b, c, 0)
(push) ; 14
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 15
(pop) ; 15
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 14
; Joined path conditions
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))
(pop) ; 13
(push) ; 13
; [else-branch: 73 | !(0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01))]
(assert (not
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
(assert (=>
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
    (<=
      0
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1))
    (<
      (-
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
        1)
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      1))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
  (and
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
    (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (or
      (<
        0
        (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
      (not
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
        (<=
          0
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
        (<
          (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1)
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (segDegree%precondition ($Snap.combine
          ($Snap.first ($Snap.second $t@18@01))
          ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
    (or
      (not
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))))))
(assert (or
  (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
  (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (validChildren%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (and
        (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (or
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (not
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
            (<=
              0
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1))
            (<
              (-
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
                1)
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (segDegree%precondition ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)))
        (or
          (not
            (and
              (<
                0
                (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
              (<
                0
                (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
    (or
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (not (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))))
(assert (or
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (not
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1 | live]
; [else-branch: 74 | !(validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 74 | validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1]
(assert (and
  (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
  (and
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1))))))
; [eval] validChildren(a, c)
(push) ; 10
(assert (validChildren%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 10
; Joined path conditions
(assert (validChildren%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 9
(push) ; 9
; [else-branch: 74 | !(validChildren(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && validChildren(First:(Second:($t@18@01)), b@16@01, c@17@01) && 0 < segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) && 0 < segLength(First:(Second:($t@18@01)), b@16@01, c@17@01) ==> segDegree((First:(Second:(Second:(First:($t@18@01)))), (_, _)), First:(Second:(First:($t@18@01))), b@16@01, segLength(First:(Second:(Second:(First:($t@18@01)))), First:(Second:(First:($t@18@01))), b@16@01) - 1) == segDegree((First:(Second:($t@18@01)), (_, _)), b@16@01, c@17@01, 0) + 1)]
(assert (not
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
    (=>
      (and
        (<
          0
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
        (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
      (=
        (segDegree ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
          ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
          (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
          1))
        (+
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second $t@18@01))
            ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
          1)))
    (validChildren%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
      (and
        (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
        (=>
          (and
            (<
              0
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
            (<
              0
              (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
          (=
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
              ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
              (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
              1))
            (+
              (segDegree ($Snap.combine
                ($Snap.first ($Snap.second $t@18@01))
                ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
              1))))))
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))))
(assert (=>
  (and
    (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (and
      (validChildren ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)
      (=>
        (and
          (<
            0
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
          (< 0 (segLength ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01)))
        (=
          (segDegree ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
            ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01 (-
            (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
            1))
          (+
            (segDegree ($Snap.combine
              ($Snap.first ($Snap.second $t@18@01))
              ($Snap.combine $Snap.unit $Snap.unit)) b@16@01 c@17@01 0)
            1)))))
  (validChildren ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
  $Snap.unit))
; [eval] segSize(a, c) == old(segSize(a, b)) + old(segSize(b, c))
; [eval] segSize(a, c)
(push) ; 8
(assert (segSize%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 8
; Joined path conditions
(assert (segSize%precondition ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
; [eval] old(segSize(a, b)) + old(segSize(b, c))
; [eval] old(segSize(a, b))
; [eval] segSize(a, b)
(push) ; 8
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 8
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
; [eval] old(segSize(b, c))
; [eval] segSize(b, c)
(push) ; 8
(assert (segSize%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(pop) ; 8
; Joined path conditions
(assert (segSize%precondition ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))
(assert (=
  (segSize ($Snap.first $t@22@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
  (+
    (segSize ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01)
    (segSize ($Snap.first ($Snap.second $t@18@01)) b@16@01 c@17@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
  $Snap.unit))
; [eval] a != b ==> segParent(a, c) == old(segParent(a, b))
; [eval] a != b
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
  b@16@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 75 | First:(Second:(First:($t@18@01))) != b@16@01 | live]
; [else-branch: 75 | First:(Second:(First:($t@18@01))) == b@16@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 75 | First:(Second:(First:($t@18@01))) != b@16@01]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    b@16@01)))
; [eval] segParent(a, c) == old(segParent(a, b))
; [eval] segParent(a, c)
(push) ; 10
; [eval] this != last
(push) ; 11
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    c@17@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    c@17@01)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      c@17@01))
  (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
; [eval] old(segParent(a, b))
; [eval] segParent(a, b)
(push) ; 10
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 10
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))
(pop) ; 9
(push) ; 9
; [else-branch: 75 | First:(Second:(First:($t@18@01))) == b@16@01]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
  b@16@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        b@16@01))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        c@17@01))
    (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      b@16@01))
  (=
    (segParent ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@18@01))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) b@16@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
  $Snap.unit))
; [eval] b != c ==> segParent(a, c) == old(segParent(b, c))
; [eval] b != c
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= b@16@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= b@16@01 c@17@01))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | b@16@01 != c@17@01 | live]
; [else-branch: 76 | b@16@01 == c@17@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 76 | b@16@01 != c@17@01]
(assert (not (= b@16@01 c@17@01)))
; [eval] segParent(a, c) == old(segParent(b, c))
; [eval] segParent(a, c)
(push) ; 10
; [eval] this != last
(push) ; 11
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    c@17@01))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    c@17@01)))
(assert (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
      c@17@01))
  (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)))
; [eval] old(segParent(b, c))
; [eval] segParent(b, c)
(push) ; 10
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 10
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second $t@18@01))
  $Snap.unit) b@16@01 c@17@01))
(pop) ; 9
(push) ; 9
; [else-branch: 76 | b@16@01 == c@17@01]
(assert (= b@16@01 c@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (not (= b@16@01 c@17@01))
  (and
    (not (= b@16@01 c@17@01))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
        c@17@01))
    (segParent%precondition ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second $t@18@01))
      $Snap.unit) b@16@01 c@17@01))))
; Joined path conditions
(assert (or (= b@16@01 c@17@01) (not (= b@16@01 c@17@01))))
(assert (=>
  (not (= b@16@01 c@17@01))
  (=
    (segParent ($Snap.combine ($Snap.first $t@22@01) $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01)))) c@17@01)
    (segParent ($Snap.combine ($Snap.first ($Snap.second $t@18@01)) $Snap.unit) b@16@01 c@17@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert c != null ==>
;   (unfolding acc(tree(a), write) in
;     (unfolding acc(tree(c), 1 / 2) in a != c))
; [eval] c != null ==> (unfolding acc(tree(a), write) in (unfolding acc(tree(c), 1 / 2) in a != c))
; [eval] c != null
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= c@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 77 | c@17@01 != Null | live]
; [else-branch: 77 | c@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 77 | c@17@01 != Null]
; [eval] (unfolding acc(tree(a), write) in (unfolding acc(tree(c), 1 / 2) in a != c))
(push) ; 10
(assert (tree%trigger ($Snap.first ($Snap.first $t@18@01)) a@15@01))
(assert (=
  ($Snap.first ($Snap.first $t@18@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.first $t@18@01)))
    ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.first $t@18@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@18@01))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
  (= c@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))
  $Snap.unit))
; [eval] this.degree == segLength(this.child, null)
; [eval] segLength(this.child, null)
(set-option :timeout 0)
(push) ; 11
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(pop) ; 11
; Joined path conditions
(assert (segLength%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))
  $Snap.unit))
; [eval] 0 < this.degree ==> segDegree(this.child, null, 0) == this.degree - 1
; [eval] 0 < this.degree
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (<
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (<
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 78 | 0 < First:(Second:(First:(First:($t@18@01)))) | live]
; [else-branch: 78 | !(0 < First:(Second:(First:(First:($t@18@01))))) | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 78 | 0 < First:(Second:(First:(First:($t@18@01))))]
(assert (<
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
; [eval] segDegree(this.child, null, 0) == this.degree - 1
; [eval] segDegree(this.child, null, 0)
(push) ; 13
; [eval] 0 <= index
; [eval] index < segLength(this, last)
; [eval] segLength(this, last)
(push) ; 14
(pop) ; 14
; Joined path conditions
(push) ; 14
(assert (not (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(assert (<
  0
  (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null)))
(assert (segDegree%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
  ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null 0))
(pop) ; 13
; Joined path conditions
(assert (and
  (<
    0
    (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
  (segDegree%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
    ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null 0)))
; [eval] this.degree - 1
(pop) ; 12
(push) ; 12
; [else-branch: 78 | !(0 < First:(Second:(First:(First:($t@18@01)))))]
(assert (not
  (<
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (<
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
  (and
    (<
      0
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
    (<
      0
      (segLength ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
    (segDegree%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null 0))))
; Joined path conditions
(assert (or
  (not
    (<
      0
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))
  (<
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
(assert (=>
  (<
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
  (=
    (segDegree ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
      ($Snap.combine $Snap.unit $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null 0)
    (-
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))
      1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))))
  $Snap.unit))
; [eval] validChildren(this.child, null)
(push) ; 11
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(pop) ; 11
; Joined path conditions
(assert (validChildren%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(assert (validChildren ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))))))))
  $Snap.unit))
; [eval] this.child != null ==> segParent(this.child, null) == this
; [eval] this.child != null
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 79 | First:(Second:(Second:(First:(First:($t@18@01))))) != Null | live]
; [else-branch: 79 | First:(Second:(Second:(First:(First:($t@18@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 79 | First:(Second:(Second:(First:(First:($t@18@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
    $Ref.null)))
; [eval] segParent(this.child, null) == this
; [eval] segParent(this.child, null)
(push) ; 13
; [eval] this != last
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(pop) ; 13
; Joined path conditions
(assert (segParent%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))
(pop) ; 12
(push) ; 12
; [else-branch: 79 | First:(Second:(Second:(First:(First:($t@18@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
  $Ref.null))
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
        $Ref.null))
    (segParent%precondition ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
      $Ref.null))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))
      $Ref.null))
  (=
    (segParent ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01))))))))
      $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first $t@18@01)))))) $Ref.null)
    a@15@01)))
; [eval] (unfolding acc(tree(c), 1 / 2) in a != c)
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (tree%trigger ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))) c@17@01))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
    ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= a@15@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= a@15@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= a@15@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= a@15@01 c@17@01)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
  $Snap.unit))
; [eval] 0 <= this.degree
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@22@01)))))))))))))))
; ---------- findMinNode ----------
