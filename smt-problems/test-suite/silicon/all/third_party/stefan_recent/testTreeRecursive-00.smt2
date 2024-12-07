(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:08:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/third_party/stefan_recent/testTreeRecursive.vpr
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
(declare-fun Tree__contents ($Snap $Ref) Seq<Int>)
(declare-fun Tree__contents%limited ($Snap $Ref) Seq<Int>)
(declare-fun Tree__contents%stateless ($Ref) Bool)
(declare-fun Tree__contents%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Tree__state%trigger ($Snap $Ref) Bool)
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
(declare-fun joined_unfolding@4@00 ($Snap $Ref) Seq<Int>)
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (= (Tree__contents%limited s@$ t@0@00) (Tree__contents s@$ t@0@00))
  :pattern ((Tree__contents s@$ t@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (Tree__contents%stateless t@0@00)
  :pattern ((Tree__contents%limited s@$ t@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (let ((result@1@00 (Tree__contents%limited s@$ t@0@00))) (=>
    (and (Tree__contents%precondition s@$ t@0@00) (not (= t@0@00 $Ref.null)))
    (> (Seq_length result@1@00) 0)))
  :pattern ((Tree__contents%limited s@$ t@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (let ((result@1@00 (Tree__contents%limited s@$ t@0@00))) true)
  :pattern ((Tree__contents%limited s@$ t@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (=>
    (Tree__contents%precondition s@$ t@0@00)
    (=
      (Tree__contents s@$ t@0@00)
      (ite
        (= t@0@00 $Ref.null)
        (as Seq_empty  Seq<Int>)
        (Seq_append
          (Seq_append
            (Tree__contents%limited (ite
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
                  $Ref.null))
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
            (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$))))
          (Tree__contents%limited (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
                $Ref.null))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((Tree__contents s@$ t@0@00))
  :pattern ((Tree__contents%stateless t@0@00) (Tree__state%trigger s@$ t@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (t@0@00 $Ref)) (!
  (=>
    (Tree__contents%precondition s@$ t@0@00)
    (ite
      (= t@0@00 $Ref.null)
      true
      (and
        (Tree__contents%precondition (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))
              $Ref.null))
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$))))
        (Tree__contents%precondition (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
              $Ref.null))
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
  :pattern ((Tree__contents s@$ t@0@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Tree__del_min ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const t@2@01 $Ref)
(declare-const sys__result@3@01 $Ref)
(declare-const diz@4@01 $Ref)
(declare-const current_thread_id@5@01 Int)
(declare-const t@6@01 $Ref)
(declare-const sys__result@7@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@5@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] t != null
(assert (not (= t@6@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
; [eval] sys__result != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= sys__result@7@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= sys__result@7@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | sys__result@7@01 != Null | live]
; [else-branch: 0 | sys__result@7@01 == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | sys__result@7@01 != Null]
(assert (not (= sys__result@7@01 $Ref.null)))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 4
; [eval] t != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= sys__result@7@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | sys__result@7@01 != Null | live]
; [else-branch: 1 | sys__result@7@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | sys__result@7@01 != Null]
(assert (Tree__contents%precondition ($Snap.first $t@9@01) sys__result@7@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= sys__result@7@01 $Ref.null))
  (Tree__contents%precondition ($Snap.first $t@9@01) sys__result@7@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 4
; [eval] t != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | t@6@01 != Null | live]
; [else-branch: 2 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(assert (Seq_equal
  (Tree__contents ($Snap.first $t@9@01) sys__result@7@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | sys__result@7@01 == Null]
(assert (= sys__result@7@01 $Ref.null))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 4
; [eval] t != null
; [then-branch: 3 | sys__result@7@01 != Null | dead]
; [else-branch: 3 | sys__result@7@01 == Null | live]
(push) ; 5
; [else-branch: 3 | sys__result@7@01 == Null]
(assert (Tree__contents%precondition $Snap.unit sys__result@7@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (= sys__result@7@01 $Ref.null)
  (Tree__contents%precondition $Snap.unit sys__result@7@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 4
; [eval] t != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | t@6@01 != Null | live]
; [else-branch: 4 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(assert (Seq_equal
  (Tree__contents $Snap.unit sys__result@7@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
(pop) ; 3
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_1: Ref
(declare-const __flatten_1@10@01 $Ref)
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@11@01 $Ref)
; [exec]
; var __flatten_3: Ref
(declare-const __flatten_3@12@01 $Ref)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@13@01 $Ref)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@14@01 $Ref)
; [exec]
; unfold acc(Tree__state(t), write)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))
; [eval] diz.Tree__left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 5 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null)))
; [eval] diz.Tree__right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Tree__state%trigger ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
; [eval] t.Tree__left == null
; [then-branch: 7 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
; [else-branch: 7 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(pop) ; 5
; [eval] !(t.Tree__left == null)
; [eval] t.Tree__left == null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
; [exec]
; __flatten_3 := Tree__del_min(diz, current_thread_id, t.Tree__left)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] t != null
(declare-const sys__result@15@01 $Ref)
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
; [eval] sys__result != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= sys__result@15@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= sys__result@15@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | sys__result@15@01 != Null | live]
; [else-branch: 9 | sys__result@15@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 9 | sys__result@15@01 != Null]
(assert (not (= sys__result@15@01 $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  sys__result@15@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(set-option :timeout 0)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= sys__result@15@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | sys__result@15@01 != Null | live]
; [else-branch: 10 | sys__result@15@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | sys__result@15@01 != Null]
(assert (Tree__contents%precondition ($Snap.first $t@16@01) sys__result@15@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= sys__result@15@01 $Ref.null))
  (Tree__contents%precondition ($Snap.first $t@16@01) sys__result@15@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 11 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(assert (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      $Ref.null))
  (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (Seq_equal
  (Tree__contents ($Snap.first $t@16@01) sys__result@15@01)
  (Seq_drop
    (Tree__contents ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_2 := __flatten_3
; [exec]
; __flatten_7 := __flatten_2
; [exec]
; t.Tree__left := __flatten_7
; [exec]
; fold acc(Tree__state(t), write)
; [eval] diz.Tree__left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= sys__result@15@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 12 | sys__result@15@01 != Null | live]
; [else-branch: 12 | sys__result@15@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | sys__result@15@01 != Null]
; [eval] diz.Tree__right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | live]
; [else-branch: 13 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null]
(assert (Tree__state%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@15@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine
        ($Snap.first $t@16@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01))
; [exec]
; __flatten_4 := t
; [exec]
; sys__result := __flatten_4
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | t@6@01 != Null | live]
; [else-branch: 14 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | t@6@01 != Null]
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; [then-branch: 15 | t@6@01 != Null | live]
; [else-branch: 15 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 15 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@15@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine
        ($Snap.first $t@16@01)
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          ($Snap.first $t@16@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | t@6@01 != Null | live]
; [else-branch: 16 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 16 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 10
(assert (not (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          ($Snap.first $t@16@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          ($Snap.first $t@16@01)
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 9 | sys__result@15@01 == Null]
(assert (= sys__result@15@01 $Ref.null))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 7
; [eval] t != null
; [then-branch: 17 | sys__result@15@01 != Null | dead]
; [else-branch: 17 | sys__result@15@01 == Null | live]
(push) ; 8
; [else-branch: 17 | sys__result@15@01 == Null]
(assert (Tree__contents%precondition $Snap.unit sys__result@15@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= sys__result@15@01 $Ref.null)
  (Tree__contents%precondition $Snap.unit sys__result@15@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 18 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 18 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(assert (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      $Ref.null))
  (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (Seq_equal
  (Tree__contents $Snap.unit sys__result@15@01)
  (Seq_drop
    (Tree__contents ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_2 := __flatten_3
; [exec]
; __flatten_7 := __flatten_2
; [exec]
; t.Tree__left := __flatten_7
; [exec]
; fold acc(Tree__state(t), write)
; [eval] diz.Tree__left != null
; [then-branch: 19 | sys__result@15@01 != Null | dead]
; [else-branch: 19 | sys__result@15@01 == Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 19 | sys__result@15@01 == Null]
; [eval] diz.Tree__right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | live]
; [else-branch: 20 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 20 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null]
(assert (Tree__state%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@15@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01))
; [exec]
; __flatten_4 := t
; [exec]
; sys__result := __flatten_4
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | t@6@01 != Null | live]
; [else-branch: 21 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 21 | t@6@01 != Null]
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | t@6@01 != Null | live]
; [else-branch: 22 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 22 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@15@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | t@6@01 != Null | live]
; [else-branch: 23 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 23 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 10
(assert (not (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@15@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine
          $Snap.unit
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Tree__state%trigger ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
; [eval] t.Tree__left == null
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(pop) ; 5
; [eval] !(t.Tree__left == null)
; [eval] t.Tree__left == null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 25 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
; [exec]
; __flatten_3 := Tree__del_min(diz, current_thread_id, t.Tree__left)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] t != null
(declare-const sys__result@17@01 $Ref)
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
; [eval] sys__result != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= sys__result@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= sys__result@17@01 $Ref.null))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | sys__result@17@01 != Null | live]
; [else-branch: 26 | sys__result@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | sys__result@17@01 != Null]
(assert (not (= sys__result@17@01 $Ref.null)))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= sys__result@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | sys__result@17@01 != Null | live]
; [else-branch: 27 | sys__result@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 27 | sys__result@17@01 != Null]
(assert (Tree__contents%precondition ($Snap.first $t@18@01) sys__result@17@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= sys__result@17@01 $Ref.null))
  (Tree__contents%precondition ($Snap.first $t@18@01) sys__result@17@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 28 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 28 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(assert (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      $Ref.null))
  (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (Seq_equal
  (Tree__contents ($Snap.first $t@18@01) sys__result@17@01)
  (Seq_drop
    (Tree__contents ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_2 := __flatten_3
; [exec]
; __flatten_7 := __flatten_2
; [exec]
; t.Tree__left := __flatten_7
; [exec]
; fold acc(Tree__state(t), write)
; [eval] diz.Tree__left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= sys__result@17@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; [then-branch: 29 | sys__result@17@01 != Null | live]
; [else-branch: 29 | sys__result@17@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | sys__result@17@01 != Null]
; [eval] diz.Tree__right != null
; [then-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | dead]
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | live]
(push) ; 8
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null]
(assert (Tree__state%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine ($Snap.first $t@18@01) $Snap.unit)))) t@6@01))
; [exec]
; __flatten_4 := t
; [exec]
; sys__result := __flatten_4
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [then-branch: 31 | t@6@01 != Null | live]
; [else-branch: 31 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 31 | t@6@01 != Null]
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; [then-branch: 32 | t@6@01 != Null | live]
; [else-branch: 32 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 32 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine ($Snap.first $t@18@01) $Snap.unit)))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine ($Snap.first $t@18@01) $Snap.unit)))) t@6@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,01s
; (get-info :all-statistics)
; [then-branch: 33 | t@6@01 != Null | live]
; [else-branch: 33 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 10
(assert (not (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine ($Snap.first $t@18@01) $Snap.unit)))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine ($Snap.first $t@18@01) $Snap.unit)))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 26 | sys__result@17@01 == Null]
(assert (= sys__result@17@01 $Ref.null))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 7
; [eval] t != null
; [then-branch: 34 | sys__result@17@01 != Null | dead]
; [else-branch: 34 | sys__result@17@01 == Null | live]
(push) ; 8
; [else-branch: 34 | sys__result@17@01 == Null]
(assert (Tree__contents%precondition $Snap.unit sys__result@17@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= sys__result@17@01 $Ref.null)
  (Tree__contents%precondition $Snap.unit sys__result@17@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | live]
; [else-branch: 35 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 35 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null]
(assert (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      $Ref.null))
  (Tree__contents%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (Seq_equal
  (Tree__contents $Snap.unit sys__result@17@01)
  (Seq_drop
    (Tree__contents ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    1)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_2 := __flatten_3
; [exec]
; __flatten_7 := __flatten_2
; [exec]
; t.Tree__left := __flatten_7
; [exec]
; fold acc(Tree__state(t), write)
; [eval] diz.Tree__left != null
; [then-branch: 36 | sys__result@17@01 != Null | dead]
; [else-branch: 36 | sys__result@17@01 == Null | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 36 | sys__result@17@01 == Null]
; [eval] diz.Tree__right != null
; [then-branch: 37 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | dead]
; [else-branch: 37 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | live]
(push) ; 8
; [else-branch: 37 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null]
(assert (Tree__state%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine $Snap.unit $Snap.unit)))) t@6@01))
; [exec]
; __flatten_4 := t
; [exec]
; sys__result := __flatten_4
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | t@6@01 != Null | live]
; [else-branch: 38 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 38 | t@6@01 != Null]
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | t@6@01 != Null | live]
; [else-branch: 39 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 39 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap sys__result@17@01)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
      ($Snap.combine $Snap.unit $Snap.unit)))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine $Snap.unit $Snap.unit)))) t@6@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 10
; [eval] t != null
(push) ; 11
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | t@6@01 != Null | live]
; [else-branch: 40 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 40 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 10
(assert (not (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine $Snap.unit $Snap.unit)))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap sys__result@17@01)
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
        ($Snap.combine $Snap.unit $Snap.unit)))) t@6@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 9
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 5 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Snap.unit))
; [eval] diz.Tree__right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
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
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null | live]
; [else-branch: 41 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 41 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Tree__state%trigger ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
; [eval] t.Tree__left == null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
; [else-branch: 42 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 42 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
; [exec]
; assert Tree__contents(t.Tree__left) == Seq[Int]()
; [eval] Tree__contents(t.Tree__left) == Seq[Int]()
; [eval] Tree__contents(t.Tree__left)
(push) ; 6
; [eval] t != null
; [then-branch: 43 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
; [else-branch: 43 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
(push) ; 7
; [else-branch: 43 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
(assert (Tree__contents%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null)
  (Tree__contents%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
; [eval] Seq[Int]()
(push) ; 6
(assert (not (Seq_equal
  (Tree__contents $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (as Seq_empty  Seq<Int>)))
; [exec]
; __flatten_1 := t.Tree__right
(declare-const __flatten_1@19@01 $Ref)
(assert (=
  __flatten_1@19@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
; [exec]
; sys__result := __flatten_1
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= __flatten_1@19@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (= __flatten_1@19@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | __flatten_1@19@01 != Null | live]
; [else-branch: 44 | __flatten_1@19@01 == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 44 | __flatten_1@19@01 != Null]
(assert (not (= __flatten_1@19@01 $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  __flatten_1@19@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(set-option :timeout 0)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= __flatten_1@19@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | __flatten_1@19@01 != Null | live]
; [else-branch: 45 | __flatten_1@19@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 45 | __flatten_1@19@01 != Null]
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  __flatten_1@19@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) __flatten_1@19@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= __flatten_1@19@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) __flatten_1@19@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(set-option :timeout 0)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | t@6@01 != Null | live]
; [else-branch: 46 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 46 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 7
(assert (not (Seq_equal
  (Tree__contents ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) __flatten_1@19@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))) __flatten_1@19@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 6
(pop) ; 5
; [eval] !(t.Tree__left == null)
; [eval] t.Tree__left == null
; [then-branch: 47 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
; [else-branch: 47 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
(push) ; 5
; [else-branch: 47 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 41 | First:(Second:(Second:(Second:(Second:(Second:($t@8@01)))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Tree__state%trigger ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
; [eval] t.Tree__left == null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
; [else-branch: 48 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
; [exec]
; assert Tree__contents(t.Tree__left) == Seq[Int]()
; [eval] Tree__contents(t.Tree__left) == Seq[Int]()
; [eval] Tree__contents(t.Tree__left)
(push) ; 6
; [eval] t != null
; [then-branch: 49 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
; [else-branch: 49 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
(push) ; 7
; [else-branch: 49 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
(assert (Tree__contents%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    $Ref.null)
  (Tree__contents%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
; [eval] Seq[Int]()
(push) ; 6
(assert (not (Seq_equal
  (Tree__contents $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  (as Seq_empty  Seq<Int>)))
; [exec]
; __flatten_1 := t.Tree__right
(declare-const __flatten_1@20@01 $Ref)
(assert (=
  __flatten_1@20@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
; [exec]
; sys__result := __flatten_1
; [exec]
; assert (sys__result != null ==> acc(Tree__state(sys__result), write)) &&
;   Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] sys__result != null
(push) ; 6
(set-option :timeout 10)
(assert (not (= __flatten_1@20@01 $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | __flatten_1@20@01 != Null | dead]
; [else-branch: 50 | __flatten_1@20@01 == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 50 | __flatten_1@20@01 == Null]
(assert (= __flatten_1@20@01 $Ref.null))
; [eval] Tree__contents(sys__result) == old(Tree__contents(t))[1..]
; [eval] Tree__contents(sys__result)
(push) ; 7
; [eval] t != null
; [then-branch: 51 | __flatten_1@20@01 != Null | dead]
; [else-branch: 51 | __flatten_1@20@01 == Null | live]
(push) ; 8
; [else-branch: 51 | __flatten_1@20@01 == Null]
(assert (Tree__contents%precondition $Snap.unit __flatten_1@20@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (= __flatten_1@20@01 $Ref.null)
  (Tree__contents%precondition $Snap.unit __flatten_1@20@01)))
; [eval] old(Tree__contents(t))[1..]
; [eval] old(Tree__contents(t))
; [eval] Tree__contents(t)
(push) ; 7
; [eval] t != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= t@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | t@6@01 != Null | live]
; [else-branch: 52 | t@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 52 | t@6@01 != Null]
(assert (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (not (= t@6@01 $Ref.null))
  (Tree__contents%precondition ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)))
(push) ; 7
(assert (not (Seq_equal
  (Tree__contents $Snap.unit __flatten_1@20@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Tree__contents $Snap.unit __flatten_1@20@01)
  (Seq_drop
    (Tree__contents ($Snap.second ($Snap.second ($Snap.second $t@8@01))) t@6@01)
    1)))
; [exec]
; inhale false
(pop) ; 6
(pop) ; 5
; [eval] !(t.Tree__left == null)
; [eval] t.Tree__left == null
; [then-branch: 53 | First:(Second:(Second:(Second:(Second:($t@8@01))))) != Null | dead]
; [else-branch: 53 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null | live]
(push) ; 5
; [else-branch: 53 | First:(Second:(Second:(Second:(Second:($t@8@01))))) == Null]
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Tree__Tree ----------
(declare-const current_thread_id@21@01 Int)
(declare-const sys__result@22@01 $Ref)
(declare-const current_thread_id@23@01 Int)
(declare-const sys__result@24@01 $Ref)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@23@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@24@01 $Ref.null)))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@26@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@26@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@26@01))) $Snap.unit))
; [eval] sys__result.Tree__data == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@26@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@26@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
  $Snap.unit))
; [eval] sys__result.Tree__left == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01))))))
  $Snap.unit))
; [eval] sys__result.Tree__right == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@26@01)))))))
  $Ref.null))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@27@01 $Ref)
; [exec]
; var __flatten_5: Int
(declare-const __flatten_5@28@01 Int)
; [exec]
; var __flatten_8: Int
(declare-const __flatten_8@29@01 Int)
; [exec]
; diz := new(Tree__data, Tree__left, Tree__right)
(declare-const diz@30@01 $Ref)
(assert (not (= diz@30@01 $Ref.null)))
(declare-const Tree__data@31@01 Int)
(declare-const Tree__left@32@01 $Ref)
(declare-const Tree__right@33@01 $Ref)
(assert (not (= diz@30@01 sys__result@24@01)))
(assert (not (= diz@30@01 diz@27@01)))
; [exec]
; __flatten_5 := 0
; [exec]
; __flatten_8 := __flatten_5
; [exec]
; diz.Tree__data := __flatten_8
; [exec]
; diz.Tree__left := null
; [exec]
; diz.Tree__right := null
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Tree__data, write) && sys__result.Tree__data == 0 &&
;   (acc(sys__result.Tree__left, write) && sys__result.Tree__left == null &&
;   (acc(sys__result.Tree__right, write) && sys__result.Tree__right == null)))
; [eval] sys__result != null
; [eval] sys__result.Tree__data == 0
; [eval] sys__result.Tree__left == null
; [eval] sys__result.Tree__right == null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
