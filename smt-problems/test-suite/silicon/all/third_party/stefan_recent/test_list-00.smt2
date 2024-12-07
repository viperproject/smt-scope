(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/test_list.vpr
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
(declare-sort Seq<Int> 0)
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
(declare-fun $SortWrappers.Seq<Int>To$Snap (Seq<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Int> ($Snap) Seq<Int>)
(assert (forall ((x Seq<Int>)) (!
    (= x ($SortWrappers.$SnapToSeq<Int>($SortWrappers.Seq<Int>To$Snap x)))
    :pattern (($SortWrappers.Seq<Int>To$Snap x))
    :qid |$Snap.$SnapToSeq<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Int>To$Snap($SortWrappers.$SnapToSeq<Int> x)))
    :pattern (($SortWrappers.$SnapToSeq<Int> x))
    :qid |$Snap.Seq<Int>To$SnapToSeq<Int>|
    )))
; ////////// Symbols
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun node__contents ($Snap $Ref) Seq<Int>)
(declare-fun node__contents%limited ($Snap $Ref) Seq<Int>)
(declare-fun node__contents%stateless ($Ref) Bool)
(declare-fun node__contents%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun node__state%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
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
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
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
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@2@00 ($Snap $Ref) Seq<Int>)
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (= (node__contents%limited s@$ diz@0@00) (node__contents s@$ diz@0@00))
  :pattern ((node__contents s@$ diz@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (node__contents%stateless diz@0@00)
  :pattern ((node__contents%limited s@$ diz@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=>
    (node__contents%precondition s@$ diz@0@00)
    (=
      (node__contents s@$ diz@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null)
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
          (node__contents%limited ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((node__contents s@$ diz@0@00))
  :pattern ((node__contents%stateless diz@0@00) (node__state%trigger ($Snap.second s@$) diz@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=>
    (node__contents%precondition s@$ diz@0@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)
      true
      (node__contents%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((node__contents s@$ diz@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- node__node ----------
(declare-const current_thread_id@0@01 Int)
(declare-const v@1@01 Int)
(declare-const n@2@01 $Ref)
(declare-const sys__result@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const v@5@01 Int)
(declare-const n@6@01 $Ref)
(declare-const sys__result@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@4@01 0))
; [eval] n != null
(push) ; 2
(set-option :timeout 10)
(assert (not (= n@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= n@6@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | n@6@01 != Null | live]
; [else-branch: 0 | n@6@01 == Null | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 0 | n@6@01 != Null]
(assert (not (= n@6@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(assert (= ($Snap.second ($Snap.second $t@9@01)) $Snap.unit))
; [eval] node__contents(sys__result) == (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] node__contents(sys__result)
(push) ; 4
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@9@01))) sys__result@7@01))
(pop) ; 4
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@9@01))) sys__result@7@01))
; [eval] (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] n == null
(push) ; 4
; [then-branch: 1 | n@6@01 == Null | dead]
; [else-branch: 1 | n@6@01 != Null | live]
(push) ; 5
; [else-branch: 1 | n@6@01 != Null]
; [eval] Seq(v) ++ old(node__contents(n))
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@5@01)) 1))
; [eval] old(node__contents(n))
; [eval] node__contents(n)
(push) ; 6
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))
(pop) ; 6
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= n@6@01 $Ref.null))
  (and
    (= (Seq_length (Seq_singleton v@5@01)) 1)
    (node__contents%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second $t@8@01)) n@6@01))))
(assert (Seq_equal
  (node__contents ($Snap.combine $Snap.unit ($Snap.first ($Snap.second $t@9@01))) sys__result@7@01)
  (Seq_append
    (Seq_singleton v@5@01)
    (node__contents ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))))
(pop) ; 3
(push) ; 3
; [exec]
; var diz: Ref
(declare-const diz@10@01 $Ref)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@11@01 Int)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@12@01 $Ref)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@13@01 Int)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@14@01 $Ref)
; [exec]
; diz := new(node__val, node__next)
(declare-const diz@15@01 $Ref)
(assert (not (= diz@15@01 $Ref.null)))
(declare-const node__val@16@01 Int)
(declare-const node__next@17@01 $Ref)
(assert (not (= diz@15@01 diz@10@01)))
(assert (not (= diz@15@01 n@6@01)))
(assert (not (= diz@15@01 __flatten_2@12@01)))
(assert (not (= diz@15@01 sys__result@7@01)))
(assert (not (= diz@15@01 __flatten_5@14@01)))
; [exec]
; __flatten_1 := v
; [exec]
; __flatten_4 := __flatten_1
; [exec]
; diz.node__val := __flatten_4
; [exec]
; __flatten_2 := n
; [exec]
; __flatten_5 := __flatten_2
; [exec]
; diz.node__next := __flatten_5
; [exec]
; fold acc(node__state(diz), write)
; [eval] diz.node__next != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= n@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | n@6@01 != Null | live]
; [else-branch: 2 | n@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | n@6@01 != Null]
(assert (node__state%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@5@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) ($Snap.second $t@8@01))) diz@15@01))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(node__state(sys__result), write) &&
;   node__contents(sys__result) ==
;   (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n))))
; [eval] sys__result != null
; [eval] node__contents(sys__result) == (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] node__contents(sys__result)
(push) ; 5
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@5@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) ($Snap.second $t@8@01)))) diz@15@01))
(pop) ; 5
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@5@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) ($Snap.second $t@8@01)))) diz@15@01))
; [eval] (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] n == null
(push) ; 5
; [then-branch: 3 | n@6@01 == Null | dead]
; [else-branch: 3 | n@6@01 != Null | live]
(push) ; 6
; [else-branch: 3 | n@6@01 != Null]
; [eval] Seq(v) ++ old(node__contents(n))
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@5@01)) 1))
; [eval] old(node__contents(n))
; [eval] node__contents(n)
(push) ; 7
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))
(pop) ; 7
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (not (= n@6@01 $Ref.null))
  (and
    (= (Seq_length (Seq_singleton v@5@01)) 1)
    (node__contents%precondition ($Snap.combine
      $Snap.unit
      ($Snap.second $t@8@01)) n@6@01))))
(push) ; 5
(assert (not (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@5@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) ($Snap.second $t@8@01)))) diz@15@01)
  (Seq_append
    (Seq_singleton v@5@01)
    (node__contents ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@5@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) ($Snap.second $t@8@01)))) diz@15@01)
  (Seq_append
    (Seq_singleton v@5@01)
    (node__contents ($Snap.combine $Snap.unit ($Snap.second $t@8@01)) n@6@01))))
; [exec]
; inhale false
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 0 | n@6@01 == Null]
(assert (= n@6@01 $Ref.null))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@7@01 $Ref.null)))
(assert (=
  ($Snap.second $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@18@01))
    ($Snap.second ($Snap.second $t@18@01)))))
(assert (= ($Snap.second ($Snap.second $t@18@01)) $Snap.unit))
; [eval] node__contents(sys__result) == (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] node__contents(sys__result)
(push) ; 4
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@18@01))) sys__result@7@01))
(pop) ; 4
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@18@01))) sys__result@7@01))
; [eval] (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] n == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= n@6@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | n@6@01 == Null | live]
; [else-branch: 4 | n@6@01 != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | n@6@01 == Null]
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@5@01)) 1))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> (= n@6@01 $Ref.null) (= (Seq_length (Seq_singleton v@5@01)) 1)))
(assert (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@18@01))) sys__result@7@01)
  (Seq_singleton v@5@01)))
(pop) ; 3
(push) ; 3
; [exec]
; var diz: Ref
(declare-const diz@19@01 $Ref)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@20@01 Int)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@21@01 $Ref)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@22@01 Int)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@23@01 $Ref)
; [exec]
; diz := new(node__val, node__next)
(declare-const diz@24@01 $Ref)
(assert (not (= diz@24@01 $Ref.null)))
(declare-const node__val@25@01 Int)
(declare-const node__next@26@01 $Ref)
(assert (not (= diz@24@01 n@6@01)))
(assert (not (= diz@24@01 __flatten_5@23@01)))
(assert (not (= diz@24@01 diz@19@01)))
(assert (not (= diz@24@01 __flatten_2@21@01)))
(assert (not (= diz@24@01 sys__result@7@01)))
; [exec]
; __flatten_1 := v
; [exec]
; __flatten_4 := __flatten_1
; [exec]
; diz.node__val := __flatten_4
; [exec]
; __flatten_2 := n
; [exec]
; __flatten_5 := __flatten_2
; [exec]
; diz.node__next := __flatten_5
; [exec]
; fold acc(node__state(diz), write)
; [eval] diz.node__next != null
; [then-branch: 5 | n@6@01 != Null | dead]
; [else-branch: 5 | n@6@01 == Null | live]
(push) ; 4
; [else-branch: 5 | n@6@01 == Null]
(assert (node__state%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@5@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) $Snap.unit)) diz@24@01))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(node__state(sys__result), write) &&
;   node__contents(sys__result) ==
;   (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n))))
; [eval] sys__result != null
; [eval] node__contents(sys__result) == (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] node__contents(sys__result)
(push) ; 5
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@5@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) $Snap.unit))) diz@24@01))
(pop) ; 5
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@5@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) $Snap.unit))) diz@24@01))
; [eval] (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] n == null
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= n@6@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | n@6@01 == Null | live]
; [else-branch: 6 | n@6@01 != Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | n@6@01 == Null]
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@5@01)) 1))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=> (= n@6@01 $Ref.null) (= (Seq_length (Seq_singleton v@5@01)) 1)))
(push) ; 5
(assert (not (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@5@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) $Snap.unit))) diz@24@01)
  (Seq_singleton v@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@5@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap n@6@01) $Snap.unit))) diz@24@01)
  (Seq_singleton v@5@01)))
; [exec]
; inhale false
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- node__main ----------
(declare-const diz@27@01 $Ref)
(declare-const current_thread_id@28@01 Int)
(declare-const diz@29@01 $Ref)
(declare-const current_thread_id@30@01 Int)
(push) ; 1
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@29@01 $Ref.null)))
(assert (= ($Snap.second $t@31@01) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@30@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Seq[Int]
(declare-const tmp@32@01 Seq<Int>)
; [exec]
; var l: Ref
(declare-const l@33@01 $Ref)
; [exec]
; var __flatten_3: Ref
(declare-const __flatten_3@34@01 $Ref)
; [exec]
; tmp := Seq(1, 2, 3)
; [eval] Seq(1, 2, 3)
(assert (=
  (Seq_length
    (Seq_append
      (Seq_append (Seq_singleton 1) (Seq_singleton 2))
      (Seq_singleton 3)))
  3))
(declare-const tmp@35@01 Seq<Int>)
(assert (=
  tmp@35@01
  (Seq_append (Seq_append (Seq_singleton 1) (Seq_singleton 2)) (Seq_singleton 3))))
; [exec]
; assert tmp == Seq(1) ++ Seq(2, 3)
; [eval] tmp == Seq(1) ++ Seq(2, 3)
; [eval] Seq(1) ++ Seq(2, 3)
; [eval] Seq(1)
(assert (= (Seq_length (Seq_singleton 1)) 1))
; [eval] Seq(2, 3)
(assert (= (Seq_length (Seq_append (Seq_singleton 2) (Seq_singleton 3))) 2))
(push) ; 3
(assert (not (Seq_equal
  tmp@35@01
  (Seq_append (Seq_singleton 1) (Seq_append (Seq_singleton 2) (Seq_singleton 3))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  tmp@35@01
  (Seq_append (Seq_singleton 1) (Seq_append (Seq_singleton 2) (Seq_singleton 3)))))
; [exec]
; assert tmp[0] == 1
; [eval] tmp[0] == 1
; [eval] tmp[0]
(push) ; 3
(assert (not (< 0 (Seq_length tmp@35@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Seq_index tmp@35@01 0) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index tmp@35@01 0) 1))
; [exec]
; assert tmp[1..] == Seq(2, 3)
; [eval] tmp[1..] == Seq(2, 3)
; [eval] tmp[1..]
; [eval] Seq(2, 3)
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop tmp@35@01 1)
  (Seq_append (Seq_singleton 2) (Seq_singleton 3)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop tmp@35@01 1)
  (Seq_append (Seq_singleton 2) (Seq_singleton 3))))
; [exec]
; __flatten_3 := node__node(current_thread_id, 37, null)
; [eval] current_thread_id >= 0
; [eval] n != null
; [then-branch: 7 | False | dead]
; [else-branch: 7 | True | live]
(push) ; 3
; [else-branch: 7 | True]
(declare-const sys__result@36@01 $Ref)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 ($Snap.combine ($Snap.first $t@37@01) ($Snap.second $t@37@01))))
(assert (= ($Snap.first $t@37@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@36@01 $Ref.null)))
(assert (=
  ($Snap.second $t@37@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@37@01))
    ($Snap.second ($Snap.second $t@37@01)))))
(assert (= ($Snap.second ($Snap.second $t@37@01)) $Snap.unit))
; [eval] node__contents(sys__result) == (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] node__contents(sys__result)
(push) ; 4
; [eval] diz != null
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@37@01))) sys__result@36@01))
(pop) ; 4
; Joined path conditions
(assert (node__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@37@01))) sys__result@36@01))
; [eval] (n == null ? Seq(v) : Seq(v) ++ old(node__contents(n)))
; [eval] n == null
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | True | live]
; [else-branch: 8 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | True]
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton 37)) 1))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (= (Seq_length (Seq_singleton 37)) 1))
(assert (Seq_equal
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@37@01))) sys__result@36@01)
  (Seq_singleton 37)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; l := __flatten_3
; [exec]
; assert node__contents(l) == Seq(37)
; [eval] node__contents(l) == Seq(37)
; [eval] node__contents(l)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] Seq(37)
; [exec]
; assert (37 in node__contents(l))
; [eval] (37 in node__contents(l))
; [eval] node__contents(l)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (Seq_contains
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@37@01))) sys__result@36@01)
  37)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_contains
  (node__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@37@01))) sys__result@36@01)
  37))
(pop) ; 3
(pop) ; 2
(pop) ; 1
