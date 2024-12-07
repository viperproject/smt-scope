(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:04:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0464.vpr
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
(declare-sort Seq<Bool> 0)
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
(declare-fun $SortWrappers.Seq<Bool>To$Snap (Seq<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Bool> ($Snap) Seq<Bool>)
(assert (forall ((x Seq<Bool>)) (!
    (= x ($SortWrappers.$SnapToSeq<Bool>($SortWrappers.Seq<Bool>To$Snap x)))
    :pattern (($SortWrappers.Seq<Bool>To$Snap x))
    :qid |$Snap.$SnapToSeq<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Bool>To$Snap($SortWrappers.$SnapToSeq<Bool> x)))
    :pattern (($SortWrappers.$SnapToSeq<Bool> x))
    :qid |$Snap.Seq<Bool>To$SnapToSeq<Bool>|
    )))
; ////////// Symbols
(declare-fun Seq_length (Seq<Bool>) Int)
(declare-const Seq_empty Seq<Bool>)
(declare-fun Seq_singleton (Bool) Seq<Bool>)
(declare-fun Seq_append (Seq<Bool> Seq<Bool>) Seq<Bool>)
(declare-fun Seq_index (Seq<Bool> Int) Bool)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Bool> Int Bool) Seq<Bool>)
(declare-fun Seq_take (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_drop (Seq<Bool> Int) Seq<Bool>)
(declare-fun Seq_contains (Seq<Bool> Bool) Bool)
(declare-fun Seq_contains_trigger (Seq<Bool> Bool) Bool)
(declare-fun Seq_skolem (Seq<Bool> Bool) Int)
(declare-fun Seq_equal (Seq<Bool> Seq<Bool>) Bool)
(declare-fun Seq_skolem_diff (Seq<Bool> Seq<Bool>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Bool>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Bool>)) 0))
(assert (forall ((s Seq<Bool>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Bool)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (not (= s1 (as Seq_empty  Seq<Bool>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Bool>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Bool)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Bool>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Bool>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (i Int) (v Bool) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Bool>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (t Seq<Bool>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Bool>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Bool>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Bool>) (x Bool)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Bool>) (x Bool) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Bool>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Bool>) (s1 Seq<Bool>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<Bool>) (b Seq<Bool>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Bool) (y Bool)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
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
; ---------- m ----------
(declare-const l@0@01 Seq<Bool>)
(declare-const l@1@01 Seq<Bool>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] |l| == 3
; [eval] |l|
(assert (= (Seq_length l@1@01) 3))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] (forall i: Int :: { l[i] } 0 <= i && i < |l| ==> l[i])
(declare-const i@3@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |l| ==> l[i]
; [eval] 0 <= i && i < |l|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@3@01) | live]
; [else-branch: 0 | 0 <= i@3@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@3@01)]
(assert (not (<= 0 i@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@3@01]
(assert (<= 0 i@3@01))
; [eval] i < |l|
; [eval] |l|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(push) ; 3
; [then-branch: 1 | 0 <= i@3@01 && i@3@01 < |l@1@01| | live]
; [else-branch: 1 | !(0 <= i@3@01 && i@3@01 < |l@1@01|) | live]
(push) ; 4
; [then-branch: 1 | 0 <= i@3@01 && i@3@01 < |l@1@01|]
(assert (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01))))
; [eval] l[i]
(push) ; 5
(assert (not (>= i@3@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(0 <= i@3@01 && i@3@01 < |l@1@01|)]
(assert (not (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01))))
  (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int)) (!
  (and
    (or (<= 0 i@3@01) (not (<= 0 i@3@01)))
    (or
      (not (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01))))
      (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01)))))
  :pattern ((Seq_index l@1@01 i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@5@24@5@69-aux|)))
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (Seq_length l@1@01)))
    (Seq_index l@1@01 i@3@01))
  :pattern ((Seq_index l@1@01 i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@5@24@5@69|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert l[((exists i: Int :: i == 0) ? 1 : 2)]
; [eval] l[((exists i: Int :: i == 0) ? 1 : 2)]
; [eval] ((exists i: Int :: i == 0) ? 1 : 2)
; [eval] (exists i: Int :: i == 0)
(declare-const i@4@01 Int)
(push) ; 3
; [eval] i == 0
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (exists ((i@4@01 Int)) (!
    (= i@4@01 0)
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (exists ((i@4@01 Int)) (!
  (= i@4@01 0)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | QE i@4@01 :: i@4@01 == 0 | live]
; [else-branch: 2 | !(QE i@4@01 :: i@4@01 == 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | QE i@4@01 :: i@4@01 == 0]
(assert (exists ((i@4@01 Int)) (!
  (= i@4@01 0)
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(QE i@4@01 :: i@4@01 == 0)]
(assert (not
  (exists ((i@4@01 Int)) (!
    (= i@4@01 0)
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (exists ((i@4@01 Int)) (!
      (= i@4@01 0)
      
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|)))
  (exists ((i@4@01 Int)) (!
    (= i@4@01 0)
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))))
(push) ; 3
(assert (not (>=
  (ite
    (exists ((i@4@01 Int)) (!
      (= i@4@01 0)
      
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))
    1
    2)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  (ite
    (exists ((i@4@01 Int)) (!
      (= i@4@01 0)
      
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))
    1
    2)
  (Seq_length l@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Seq_index
  l@1@01
  (ite
    (exists ((i@4@01 Int)) (!
      (= i@4@01 0)
      
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))
    1
    2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_index
  l@1@01
  (ite
    (exists ((i@4@01 Int)) (!
      (= i@4@01 0)
      
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@7@13@7@36|))
    1
    2)))
(pop) ; 2
(pop) ; 1
; ---------- n ----------
(declare-const l@5@01 Seq<Bool>)
(declare-const l@6@01 Seq<Bool>)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] |l| == 3
; [eval] |l|
(assert (= (Seq_length l@6@01) 3))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (forall i: Int :: { l[i] } 0 <= i && i < |l| ==> l[i])
(declare-const i@8@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |l| ==> l[i]
; [eval] 0 <= i && i < |l|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@8@01) | live]
; [else-branch: 3 | 0 <= i@8@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@8@01)]
(assert (not (<= 0 i@8@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@8@01]
(assert (<= 0 i@8@01))
; [eval] i < |l|
; [eval] |l|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@8@01) (not (<= 0 i@8@01))))
(push) ; 3
; [then-branch: 4 | 0 <= i@8@01 && i@8@01 < |l@6@01| | live]
; [else-branch: 4 | !(0 <= i@8@01 && i@8@01 < |l@6@01|) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i@8@01 && i@8@01 < |l@6@01|]
(assert (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01))))
; [eval] l[i]
(push) ; 5
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i@8@01 && i@8@01 < |l@6@01|)]
(assert (not (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01))))
  (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@8@01 Int)) (!
  (and
    (or (<= 0 i@8@01) (not (<= 0 i@8@01)))
    (or
      (not (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01))))
      (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01)))))
  :pattern ((Seq_index l@6@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@11@24@11@69-aux|)))
(assert (forall ((i@8@01 Int)) (!
  (=>
    (and (<= 0 i@8@01) (< i@8@01 (Seq_length l@6@01)))
    (Seq_index l@6@01 i@8@01))
  :pattern ((Seq_index l@6@01 i@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@11@24@11@69|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert l[((forall i: Int ::i == i) ? 1 : 2)]
; [eval] l[((forall i: Int ::i == i) ? 1 : 2)]
; [eval] ((forall i: Int ::i == i) ? 1 : 2)
; [eval] (forall i: Int ::i == i)
(declare-const i@9@01 Int)
(push) ; 3
; [eval] i == i
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (forall ((i@9@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0464.vpr@13@13@13@36|)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | QA i@9@01 :: True | live]
; [else-branch: 5 | !(QA i@9@01 :: True) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | QA i@9@01 :: True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (< 1 (Seq_length l@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Seq_index l@6@01 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_index l@6@01 1))
(pop) ; 2
(pop) ; 1
