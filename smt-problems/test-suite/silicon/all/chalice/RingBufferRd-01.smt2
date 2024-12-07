(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:42:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/chalice/RingBufferRd.vpr
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
(declare-fun Contents ($Snap $Ref) Seq<Int>)
(declare-fun Contents%limited ($Snap $Ref) Seq<Int>)
(declare-fun Contents%stateless ($Ref) Bool)
(declare-fun Contents%precondition ($Snap $Ref) Bool)
(declare-fun HeadF ($Snap $Ref) Int)
(declare-fun HeadF%limited ($Snap $Ref) Int)
(declare-fun HeadF%stateless ($Ref) Bool)
(declare-fun HeadF%precondition ($Snap $Ref) Bool)
(declare-fun Capacity ($Snap $Ref) Int)
(declare-fun Capacity%limited ($Snap $Ref) Int)
(declare-fun Capacity%stateless ($Ref) Bool)
(declare-fun Capacity%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Valid%trigger ($Snap $Ref) Bool)
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
; ---------- FUNCTION Contents----------
(declare-fun this@0@00 () $Ref)
(declare-fun result@1@00 () Seq<Int>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@6@00 $Perm)
(assert ($Perm.isReadVar $k@6@00))
(assert (<= $Perm.No $k@6@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (Contents%limited s@$ this@0@00) (Contents s@$ this@0@00))
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (Contents%stateless this@0@00)
  :pattern ((Contents%limited s@$ this@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@6@00))
(assert (<= $Perm.No $k@6@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Valid(this), wildcard) in (|this.data| == 0 ? Seq[Int]() : (this.first + this.len <= |this.data| ? this.data[this.first..this.first + this.len] : this.data[this.first..] ++ this.data[..this.first + this.len - |this.data|])))
(declare-const $k@7@00 $Perm)
(assert ($Perm.isReadVar $k@7@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@8@00 $Perm)
(assert ($Perm.isReadVar $k@8@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@6@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@8@00 $k@6@00))
(assert (<= $Perm.No (- $k@6@00 $k@8@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Valid%trigger s@$ this@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@7@00))
(assert (<= $k@7@00 $Perm.Write))
(assert (=> (< $Perm.No $k@7@00) (not (= this@0@00 $Ref.null))))
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
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] 0 <= this.first
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.len
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | |First:(s@$)| == 0 | live]
; [else-branch: 0 | |First:(s@$)| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | |First:(s@$)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:(Second:(s@$))) != 0 | live]
; [else-branch: 1 | First:(Second:(Second:(s@$))) == 0 | live]
(push) ; 6
; [then-branch: 1 | First:(Second:(Second:(s@$))) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | First:(Second:(Second:(s@$))) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))) 0))
; [eval] this.first == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    0)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      0))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | |First:(s@$)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        0)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          0))))))
; Joined path conditions
(assert (or
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      0)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | |First:(s@$)| > 0 | live]
; [else-branch: 2 | !(|First:(s@$)| > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | |First:(s@$)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | !(First:(Second:(Second:(s@$))) <= |First:(s@$)|) | live]
; [else-branch: 3 | First:(Second:(Second:(s@$))) <= |First:(s@$)| | live]
(push) ; 6
; [then-branch: 3 | !(First:(Second:(Second:(s@$))) <= |First:(s@$)|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | First:(Second:(Second:(s@$))) <= |First:(s@$)|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
; [eval] this.first < |this.data|
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | !(|First:(s@$)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))))
; Joined path conditions
(assert (or
  (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))
; [eval] (|this.data| == 0 ? Seq[Int]() : (this.first + this.len <= |this.data| ? this.data[this.first..this.first + this.len] : this.data[this.first..] ++ this.data[..this.first + this.len - |this.data|]))
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | |First:(s@$)| == 0 | live]
; [else-branch: 4 | |First:(s@$)| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | |First:(s@$)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
; [eval] Seq[Int]()
(pop) ; 4
(push) ; 4
; [else-branch: 4 | |First:(s@$)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
; [eval] (this.first + this.len <= |this.data| ? this.data[this.first..this.first + this.len] : this.data[this.first..] ++ this.data[..this.first + this.len - |this.data|])
; [eval] this.first + this.len <= |this.data|
; [eval] this.first + this.len
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (<=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(s@$)) + First:(Second:(Second:(s@$))) <= |First:(s@$)| | live]
; [else-branch: 5 | !(First:(Second:(s@$)) + First:(Second:(Second:(s@$))) <= |First:(s@$)|) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | First:(Second:(s@$)) + First:(Second:(Second:(s@$))) <= |First:(s@$)|]
(assert (<=
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
; [eval] this.data[this.first..this.first + this.len]
; [eval] this.data[..this.first + this.len]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this.first + this.len
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 5 | !(First:(Second:(s@$)) + First:(Second:(Second:(s@$))) <= |First:(s@$)|)]
(assert (not
  (<=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
; [eval] this.data[this.first..] ++ this.data[..this.first + this.len - |this.data|]
; [eval] this.data[this.first..]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this.data[..this.first + this.len - |this.data|]
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] this.first + this.len - |this.data|
; [eval] this.first + this.len
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<=
      (+
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
  (<=
    (+
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (and
    (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (or
      (not
        (<=
          (+
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
      (<=
        (+
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@8@00))
(assert (and
  (< $k@8@00 $k@6@00)
  (<= $Perm.No (- $k@6@00 $k@8@00))
  (Valid%trigger s@$ this@0@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@7@00)
  (<= $k@7@00 $Perm.Write)
  (=> (< $Perm.No $k@7@00) (not (= this@0@00 $Ref.null)))
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
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (=>
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
      (or
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          0)
        (not
          (=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
            0)))))
  (or
    (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (=>
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        0)
      (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (=>
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
      (or
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
        (not
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
            (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))))
  (or
    (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (=>
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
      (<
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
  (=>
    (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (and
      (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
      (or
        (not
          (<=
            (+
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
            (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
        (<=
          (+
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))))
(assert (=
  result@1@00
  (ite
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (as Seq_empty  Seq<Int>)
    (ite
      (<=
        (+
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
      (Seq_drop
        (Seq_take
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
          (+
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
      (Seq_append
        (Seq_drop
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
        (Seq_take
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
          (-
            (+
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
            (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@6@00)
    ($Perm.isReadVar $k@7@00)
    ($Perm.isReadVar $k@8@00)
    (=>
      (Contents%precondition s@$ this@0@00)
      (=
        (Contents s@$ this@0@00)
        (ite
          (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
          (as Seq_empty  Seq<Int>)
          (ite
            (<=
              (+
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
              (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
            (Seq_drop
              (Seq_take
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                (+
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
              ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
            (Seq_append
              (Seq_drop
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
              (Seq_take
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))
                (-
                  (+
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
                    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
                  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))))))
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((Contents s@$ this@0@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION HeadF----------
(declare-fun this@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const $k@9@00 $Perm)
(assert ($Perm.isReadVar $k@9@00))
(assert (<= $Perm.No $k@9@00))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] Contents(this) != Seq[Int]()
; [eval] Contents(this)
(push) ; 2
(declare-const $k@10@00 $Perm)
(assert ($Perm.isReadVar $k@10@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@10@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@10@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Contents%precondition ($Snap.first s@$) this@2@00))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@10@00))
(assert (and
  (< $k@10@00 $k@9@00)
  (<= $Perm.No (- $k@9@00 $k@10@00))
  (Contents%precondition ($Snap.first s@$) this@2@00)))
; [eval] Seq[Int]()
(assert (not (Seq_equal (Contents ($Snap.first s@$) this@2@00) (as Seq_empty  Seq<Int>))))
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 $Snap.unit))
; [eval] result == Contents(this)[0]
; [eval] Contents(this)[0]
; [eval] Contents(this)
(set-option :timeout 0)
(push) ; 2
(declare-const $k@12@00 $Perm)
(assert ($Perm.isReadVar $k@12@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@12@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@12@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@12@00))
(assert (and (< $k@12@00 $k@9@00) (<= $Perm.No (- $k@9@00 $k@12@00))))
(set-option :timeout 0)
(push) ; 2
(assert (not (< 0 (Seq_length (Contents ($Snap.first s@$) this@2@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 (Seq_index (Contents ($Snap.first s@$) this@2@00) 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (= (HeadF%limited s@$ this@2@00) (HeadF s@$ this@2@00))
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (HeadF%stateless this@2@00)
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (HeadF%limited s@$ this@2@00))) (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@12@00)
    (=>
      (HeadF%precondition s@$ this@2@00)
      (= result@3@00 (Seq_index (Contents ($Snap.first s@$) this@2@00) 0)))))
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (let ((result@3@00 (HeadF%limited s@$ this@2@00))) (=>
    (HeadF%precondition s@$ this@2@00)
    (Contents%precondition ($Snap.first s@$) this@2@00)))
  :pattern ((HeadF%limited s@$ this@2@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@9@00))
(assert ($Perm.isReadVar $k@10@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@9@00))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (< $k@10@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@10@00)))
(assert (Contents%precondition ($Snap.first s@$) this@2@00))
(assert (not (Seq_equal (Contents ($Snap.first s@$) this@2@00) (as Seq_empty  Seq<Int>))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Valid(this), wildcard) in this.data[this.first])
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@14@00 $Perm)
(assert ($Perm.isReadVar $k@14@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@14@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@14@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Valid%trigger ($Snap.first s@$) this@2@00))
(assert (=
  ($Snap.first s@$)
  ($Snap.combine
    ($Snap.first ($Snap.first s@$))
    ($Snap.second ($Snap.first s@$)))))
(assert (<= $Perm.No $k@13@00))
(assert (<= $k@13@00 $Perm.Write))
(assert (=> (< $Perm.No $k@13@00) (not (= this@2@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first s@$)))
    ($Snap.second ($Snap.second ($Snap.first s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  $Snap.unit))
; [eval] 0 <= this.first
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  $Snap.unit))
; [eval] 0 <= this.len
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | |First:(First:(s@$))| == 0 | dead]
; [else-branch: 6 | |First:(First:(s@$))| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | |First:(First:(s@$))| != 0]
(assert (not
  (=
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not
  (=
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | |First:(First:(s@$))| > 0 | live]
; [else-branch: 7 | !(|First:(First:(s@$))| > 0) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | |First:(First:(s@$))| > 0]
(assert (>
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
  0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | !(First:(Second:(Second:(First:(s@$)))) <= |First:(First:(s@$))|) | live]
; [else-branch: 8 | First:(Second:(Second:(First:(s@$)))) <= |First:(First:(s@$))| | live]
(push) ; 6
; [then-branch: 8 | !(First:(Second:(Second:(First:(s@$)))) <= |First:(First:(s@$))|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | First:(Second:(Second:(First:(s@$)))) <= |First:(First:(s@$))|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))))
; [eval] this.first < |this.data|
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0)
  (and
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
      0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          (Seq_length
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))))))))
(assert (>
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
  0))
(assert (=>
  (>
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))))))
; [eval] this.data[this.first]
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@14@00))
(assert (and
  (< $k@14@00 $k@9@00)
  (<= $Perm.No (- $k@9@00 $k@14@00))
  (Valid%trigger ($Snap.first s@$) this@2@00)
  (=
    ($Snap.first s@$)
    ($Snap.combine
      ($Snap.first ($Snap.first s@$))
      ($Snap.second ($Snap.first s@$))))
  (<= $Perm.No $k@13@00)
  (<= $k@13@00 $Perm.Write)
  (=> (< $Perm.No $k@13@00) (not (= this@2@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.first s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first s@$)))
      ($Snap.second ($Snap.second ($Snap.first s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
    $Snap.unit)
  (not
    (=
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
      0))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))))
    $Snap.unit)
  (=>
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
      0)
    (and
      (>
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
        0)
      (or
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
          (Seq_length
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))
        (not
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
            (Seq_length
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))))))
  (>
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
    0)
  (=>
    (>
      (Seq_length
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$))))
      0)
    (and
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$)))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))
      (<
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))
        (Seq_length
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))))))))
(assert (=
  result@3@00
  (Seq_index
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$)))))))
; [eval] result == Contents(this)[0]
; [eval] Contents(this)[0]
; [eval] Contents(this)
(push) ; 2
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@9@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@15@00 $k@9@00))
(assert (<= $Perm.No (- $k@9@00 $k@15@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@15@00))
(assert (and (< $k@15@00 $k@9@00) (<= $Perm.No (- $k@9@00 $k@15@00))))
(set-option :timeout 0)
(push) ; 2
(assert (not (< 0 (Seq_length (Contents ($Snap.first s@$) this@2@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (= result@3@00 (Seq_index (Contents ($Snap.first s@$) this@2@00) 0))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 (Seq_index (Contents ($Snap.first s@$) this@2@00) 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    ($Perm.isReadVar $k@10@00)
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    (=>
      (HeadF%precondition s@$ this@2@00)
      (=
        (HeadF s@$ this@2@00)
        (Seq_index
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.first s@$)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first s@$))))))))
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref)) (!
  true
  :pattern ((HeadF s@$ this@2@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION Capacity----------
(declare-fun this@4@00 () $Ref)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(assert (<= $Perm.No $k@16@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (= (Capacity%limited s@$ this@4@00) (Capacity s@$ this@4@00))
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (Capacity%stateless this@4@00)
  :pattern ((Capacity%limited s@$ this@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert ($Perm.isReadVar $k@16@00))
(assert (<= $Perm.No $k@16@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(Valid(this), wildcard) in |this.data|)
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@18@00 $Perm)
(assert ($Perm.isReadVar $k@18@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@16@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@18@00 $k@16@00))
(assert (<= $Perm.No (- $k@16@00 $k@18@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Valid%trigger s@$ this@4@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (<= $Perm.No $k@17@00))
(assert (<= $k@17@00 $Perm.Write))
(assert (=> (< $Perm.No $k@17@00) (not (= this@4@00 $Ref.null))))
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
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] 0 <= this.first
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 0 <= this.len
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | |First:(s@$)| == 0 | live]
; [else-branch: 9 | |First:(s@$)| != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | |First:(s@$)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | First:(Second:(Second:(s@$))) != 0 | live]
; [else-branch: 10 | First:(Second:(Second:(s@$))) == 0 | live]
(push) ; 6
; [then-branch: 10 | First:(Second:(Second:(s@$))) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    0)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | First:(Second:(Second:(s@$))) == 0]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))) 0))
; [eval] this.first == 0
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    0)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      0))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 9 | |First:(s@$)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        0)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          0))))))
; Joined path conditions
(assert (or
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      0)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | |First:(s@$)| > 0 | live]
; [else-branch: 11 | !(|First:(s@$)| > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | |First:(s@$)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | !(First:(Second:(Second:(s@$))) <= |First:(s@$)|) | live]
; [else-branch: 12 | First:(Second:(Second:(s@$))) <= |First:(s@$)| | live]
(push) ; 6
; [then-branch: 12 | !(First:(Second:(Second:(s@$))) <= |First:(s@$)|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | First:(Second:(Second:(s@$))) <= |First:(s@$)|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
; [eval] this.first < |this.data|
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] |this.data|
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(|First:(s@$)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))))
; Joined path conditions
(assert (or
  (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)))
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))))
; [eval] |this.data|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@18@00))
(assert (and
  (< $k@18@00 $k@16@00)
  (<= $Perm.No (- $k@16@00 $k@18@00))
  (Valid%trigger s@$ this@4@00)
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))
  (<= $Perm.No $k@17@00)
  (<= $k@17@00 $Perm.Write)
  (=> (< $Perm.No $k@17@00) (not (= this@4@00 $Ref.null)))
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
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (<=
    0
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$)))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (=>
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
      (or
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          0)
        (not
          (=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
            0)))))
  (or
    (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (=>
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        0)
      (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))) 0)))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (=>
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
      (or
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
        (not
          (<=
            ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
            (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))))
  (or
    (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0))
  (=>
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))) 0)
    (and
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))
      (<
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))))
(assert (= result@5@00 (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    (=>
      (Capacity%precondition s@$ this@4@00)
      (=
        (Capacity s@$ this@4@00)
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first s@$))))))
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (this@4@00 $Ref)) (!
  true
  :pattern ((Capacity s@$ this@4@00))
  :qid |quant-u-13|)))
; ---------- Valid ----------
(declare-const this@19@00 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@20@00 $Snap)
(assert (= $t@20@00 ($Snap.combine ($Snap.first $t@20@00) ($Snap.second $t@20@00))))
(assert (not (= this@19@00 $Ref.null)))
(assert (=
  ($Snap.second $t@20@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@00))
    ($Snap.second ($Snap.second $t@20@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@20@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@20@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@20@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@20@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@20@00))))
  $Snap.unit))
; [eval] 0 <= this.first
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@00)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00)))))
  $Snap.unit))
; [eval] 0 <= this.len
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00))))))
  $Snap.unit))
; [eval] |this.data| == 0 ==> this.len == 0 && this.first == 0
; [eval] |this.data| == 0
; [eval] |this.data|
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | |First:($t@20@00)| == 0 | live]
; [else-branch: 13 | |First:($t@20@00)| != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | |First:($t@20@00)| == 0]
(assert (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))
; [eval] this.len == 0 && this.first == 0
; [eval] this.len == 0
(push) ; 4
; [then-branch: 14 | First:(Second:(Second:($t@20@00))) != 0 | live]
; [else-branch: 14 | First:(Second:(Second:($t@20@00))) == 0 | live]
(push) ; 5
; [then-branch: 14 | First:(Second:(Second:($t@20@00))) != 0]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
    0)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | First:(Second:(Second:($t@20@00))) == 0]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
  0))
; [eval] this.first == 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
    0)
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
      0))))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | |First:($t@20@00)| != 0]
(assert (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
  (and
    (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
    (or
      (=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
        0)
      (not
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
          0))))))
; Joined path conditions
(assert (or
  (not (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(assert (=>
  (= (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
      0)
    (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@00))) 0))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@20@00))))))
  $Snap.unit))
; [eval] |this.data| > 0 ==> this.len <= |this.data| && this.first < |this.data|
; [eval] |this.data| > 0
; [eval] |this.data|
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | |First:($t@20@00)| > 0 | live]
; [else-branch: 15 | !(|First:($t@20@00)| > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | |First:($t@20@00)| > 0]
(assert (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))
; [eval] this.len <= |this.data| && this.first < |this.data|
; [eval] this.len <= |this.data|
; [eval] |this.data|
(push) ; 4
; [then-branch: 16 | !(First:(Second:(Second:($t@20@00))) <= |First:($t@20@00)|) | live]
; [else-branch: 16 | First:(Second:(Second:($t@20@00))) <= |First:($t@20@00)| | live]
(push) ; 5
; [then-branch: 16 | !(First:(Second:(Second:($t@20@00))) <= |First:($t@20@00)|)]
(assert (not
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))))))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | First:(Second:(Second:($t@20@00))) <= |First:($t@20@00)|]
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
  (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00)))))
; [eval] this.first < |this.data|
; [eval] |this.data|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (<=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
    (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))))
  (not
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00)))))))
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(|First:($t@20@00)| > 0)]
(assert (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
  (and
    (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
    (or
      (<=
        ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
        (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))))
      (not
        (<=
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
          (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00)))))))))
; Joined path conditions
(assert (or
  (not (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0))
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)))
(assert (=>
  (> (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))) 0)
  (and
    (<=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@20@00))))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00))))
    (<
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@00)))
      (Seq_length ($SortWrappers.$SnapToSeq<Int> ($Snap.first $t@20@00)))))))
(pop) ; 1
