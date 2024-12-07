(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:29
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0810.vpr
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
(declare-sort Seq<$Ref> 0)
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort PyType 0)
(declare-sort $FVF<Node_function_name> 0)
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
(declare-fun $SortWrappers.Seq<$Ref>To$Snap (Seq<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Ref> ($Snap) Seq<$Ref>)
(assert (forall ((x Seq<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Ref>($SortWrappers.Seq<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Ref>To$Snap($SortWrappers.$SnapToSeq<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Ref> x))
    :qid |$Snap.Seq<$Ref>To$SnapToSeq<$Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Seq<$Ref>>To$Snap (Set<Seq<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<$Ref>> ($Snap) Set<Seq<$Ref>>)
(assert (forall ((x Set<Seq<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<$Ref>>($SortWrappers.Set<Seq<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<$Ref>>To$Snap($SortWrappers.$SnapToSet<Seq<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<$Ref>> x))
    :qid |$Snap.Set<Seq<$Ref>>To$SnapToSet<Seq<$Ref>>|
    )))
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.$SnapToSet<$Snap>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Snap>To$Snap($SortWrappers.$SnapToSet<$Snap> x)))
    :pattern (($SortWrappers.$SnapToSet<$Snap> x))
    :qid |$Snap.Set<$Snap>To$SnapToSet<$Snap>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.PyTypeTo$Snap (PyType) $Snap)
(declare-fun $SortWrappers.$SnapToPyType ($Snap) PyType)
(assert (forall ((x PyType)) (!
    (= x ($SortWrappers.$SnapToPyType($SortWrappers.PyTypeTo$Snap x)))
    :pattern (($SortWrappers.PyTypeTo$Snap x))
    :qid |$Snap.$SnapToPyTypeTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.PyTypeTo$Snap($SortWrappers.$SnapToPyType x)))
    :pattern (($SortWrappers.$SnapToPyType x))
    :qid |$Snap.PyTypeTo$SnapToPyType|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<Node_function_name>To$Snap ($FVF<Node_function_name>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Node_function_name> ($Snap) $FVF<Node_function_name>)
(assert (forall ((x $FVF<Node_function_name>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Node_function_name>($SortWrappers.$FVF<Node_function_name>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Node_function_name>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Node_function_name>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Node_function_name>To$Snap($SortWrappers.$SnapTo$FVF<Node_function_name> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Node_function_name> x))
    :qid |$Snap.$FVF<Node_function_name>To$SnapTo$FVF<Node_function_name>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Seq<$Ref>>) Int)
(declare-const Set_empty Set<Seq<$Ref>>)
(declare-fun Set_in (Seq<$Ref> Set<Seq<$Ref>>) Bool)
(declare-fun Set_singleton (Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_unionone (Set<Seq<$Ref>> Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_union (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_intersection (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_difference (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_subset (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_equal (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<$Ref>> Set<Seq<$Ref>>) Seq<$Ref>)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_skolem_diff (Set<$Snap> Set<$Snap>) $Snap)
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_contains_trigger (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_skolem (Seq<$Ref> $Ref) Int)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Ref> Seq<$Ref>) Int)
(declare-fun extends_<Bool> (PyType PyType) Bool)
(declare-fun issubtype<Bool> (PyType PyType) Bool)
(declare-fun isnotsubtype<Bool> (PyType PyType) Bool)
(declare-fun typeof<PyType> ($Ref) PyType)
(declare-fun get_basic<PyType> (PyType) PyType)
(declare-fun union_type_1<PyType> (PyType) PyType)
(declare-fun union_type_2<PyType> (PyType PyType) PyType)
(declare-fun union_type_3<PyType> (PyType PyType PyType) PyType)
(declare-fun union_type_4<PyType> (PyType PyType PyType PyType) PyType)
(declare-const object<PyType> PyType)
(declare-const list_basic<PyType> PyType)
(declare-fun list<PyType> (PyType) PyType)
(declare-const set_basic<PyType> PyType)
(declare-fun set<PyType> (PyType) PyType)
(declare-fun set_arg<PyType> (PyType Int) PyType)
(declare-const dict_basic<PyType> PyType)
(declare-fun dict<PyType> (PyType PyType) PyType)
(declare-fun dict_arg<PyType> (PyType Int) PyType)
(declare-const int<PyType> PyType)
(declare-const float<PyType> PyType)
(declare-const bool<PyType> PyType)
(declare-const NoneType<PyType> PyType)
(declare-const Exception<PyType> PyType)
(declare-const ConnectionRefusedError<PyType> PyType)
(declare-const traceback<PyType> PyType)
(declare-const str<PyType> PyType)
(declare-const bytes<PyType> PyType)
(declare-const __prim__perm<PyType> PyType)
(declare-const PSeq_basic<PyType> PyType)
(declare-fun PSeq<PyType> (PyType) PyType)
(declare-fun PSeq_arg<PyType> (PyType Int) PyType)
(declare-const PSet_basic<PyType> PyType)
(declare-fun PSet<PyType> (PyType) PyType)
(declare-fun PSet_arg<PyType> (PyType Int) PyType)
(declare-const PMultiset_basic<PyType> PyType)
(declare-fun PMultiset<PyType> (PyType) PyType)
(declare-fun PMultiset_arg<PyType> (PyType Int) PyType)
(declare-const slice<PyType> PyType)
(declare-const range_0<PyType> PyType)
(declare-const Iterator_basic<PyType> PyType)
(declare-fun Iterator<PyType> (PyType) PyType)
(declare-fun Iterator_arg<PyType> (PyType Int) PyType)
(declare-const Thread_0<PyType> PyType)
(declare-const LevelType<PyType> PyType)
(declare-const type<PyType> PyType)
(declare-const Place<PyType> PyType)
(declare-const __prim__Seq_type<PyType> PyType)
(declare-const Node<PyType> PyType)
; /field_value_functions_declarations.smt2 [Node_function_name: Ref]
(declare-fun $FVF.domain_Node_function_name ($FVF<Node_function_name>) Set<$Ref>)
(declare-fun $FVF.lookup_Node_function_name ($FVF<Node_function_name> $Ref) $Ref)
(declare-fun $FVF.after_Node_function_name ($FVF<Node_function_name> $FVF<Node_function_name>) Bool)
(declare-fun $FVF.loc_Node_function_name ($Ref $Ref) Bool)
(declare-fun $FVF.perm_Node_function_name ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Node_function_name $FVF<Node_function_name>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun int___unbox__ ($Snap $Ref) Int)
(declare-fun int___unbox__%limited ($Snap $Ref) Int)
(declare-fun int___unbox__%stateless ($Ref) Bool)
(declare-fun int___unbox__%precondition ($Snap $Ref) Bool)
(declare-fun __prim__int___box__ ($Snap Int) $Ref)
(declare-fun __prim__int___box__%limited ($Snap Int) $Ref)
(declare-fun __prim__int___box__%stateless (Int) Bool)
(declare-fun __prim__int___box__%precondition ($Snap Int) Bool)
(declare-fun list___len__ ($Snap $Ref) Int)
(declare-fun list___len__%limited ($Snap $Ref) Int)
(declare-fun list___len__%stateless ($Ref) Bool)
(declare-fun list___len__%precondition ($Snap $Ref) Bool)
(declare-fun int___lt__ ($Snap Int Int) Bool)
(declare-fun int___lt__%limited ($Snap Int Int) Bool)
(declare-fun int___lt__%stateless (Int Int) Bool)
(declare-fun int___lt__%precondition ($Snap Int Int) Bool)
(declare-fun list___getitem__ ($Snap $Ref $Ref) $Ref)
(declare-fun list___getitem__%limited ($Snap $Ref $Ref) $Ref)
(declare-fun list___getitem__%stateless ($Ref $Ref) Bool)
(declare-fun list___getitem__%precondition ($Snap $Ref $Ref) Bool)
(declare-fun int___ge__ ($Snap Int Int) Bool)
(declare-fun int___ge__%limited ($Snap Int Int) Bool)
(declare-fun int___ge__%stateless (Int Int) Bool)
(declare-fun int___ge__%precondition ($Snap Int Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
(assert (distinct bool<PyType> float<PyType> bytes<PyType> slice<PyType> list_basic<PyType> ConnectionRefusedError<PyType> PMultiset_basic<PyType> int<PyType> Iterator_basic<PyType> str<PyType> PSeq_basic<PyType> object<PyType> traceback<PyType> dict_basic<PyType> type<PyType> __prim__perm<PyType> set_basic<PyType> PSet_basic<PyType> Node<PyType> Exception<PyType> range_0<PyType> __prim__Seq_type<PyType> Thread_0<PyType> Place<PyType> LevelType<PyType> NoneType<PyType>))
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (not (= s1 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Ref)) (!
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
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
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
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
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
(assert (forall ((a Seq<$Ref>) (b Seq<$Ref>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Ref) (y $Ref)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Snap)) (!
  (not (Set_in o (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in o (as Set_empty  Set<$Snap>)))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Snap))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Snap)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Snap) (o $Snap)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Snap)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (o $Snap)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Snap)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((sub PyType) (middle PyType) (super PyType)) (!
  (=>
    (and (issubtype<Bool> sub middle) (issubtype<Bool> middle super))
    (issubtype<Bool> sub super))
  :pattern ((issubtype<Bool> sub middle) (issubtype<Bool> middle super))
  :qid |prog.issubtype_transitivity|)))
(assert (forall ((type_ PyType)) (!
  (issubtype<Bool> type_ type_)
  :pattern ((issubtype<Bool> type_ type_))
  :qid |prog.issubtype_reflexivity|)))
(assert (forall ((sub PyType) (sub2 PyType)) (!
  (=> (extends_<Bool> sub sub2) (issubtype<Bool> sub sub2))
  :pattern ((extends_<Bool> sub sub2))
  :qid |prog.extends_implies_subtype|)))
(assert (forall ((sub PyType) (sub2 PyType) (super PyType)) (!
  (=>
    (and
      (extends_<Bool> sub super)
      (and (extends_<Bool> sub2 super) (not (= sub sub2))))
    (and (isnotsubtype<Bool> sub sub2) (isnotsubtype<Bool> sub2 sub)))
  :pattern ((extends_<Bool> sub super) (extends_<Bool> sub2 super))
  :qid |prog.issubtype_exclusion|)))
(assert (forall ((sub PyType) (middle PyType) (super PyType)) (!
  (=>
    (and (issubtype<Bool> sub middle) (isnotsubtype<Bool> middle super))
    (not (issubtype<Bool> sub super)))
  :pattern ((issubtype<Bool> sub middle) (isnotsubtype<Bool> middle super))
  :qid |prog.issubtype_exclusion_propagation|)))
(assert (forall ((var0 PyType)) (!
  (and
    (extends_<Bool> (list<PyType> var0) (as object<PyType>  PyType))
    (= (get_basic<PyType> (list<PyType> var0)) (as list_basic<PyType>  PyType)))
  :pattern ((list<PyType> var0))
  :qid |prog.subtype_list|)))
(assert (and
  (extends_<Bool> (as int<PyType>  PyType) (as float<PyType>  PyType))
  (= (get_basic<PyType> (as int<PyType>  PyType)) (as int<PyType>  PyType))))
(assert (and
  (extends_<Bool> (as float<PyType>  PyType) (as object<PyType>  PyType))
  (= (get_basic<PyType> (as float<PyType>  PyType)) (as float<PyType>  PyType))))
(assert (extends_<Bool> (as bool<PyType>  PyType) (as int<PyType>  PyType)))
; /field_value_functions_axioms.smt2 [Node_function_name: Ref]
(assert (forall ((vs $FVF<Node_function_name>) (ws $FVF<Node_function_name>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Node_function_name vs) ($FVF.domain_Node_function_name ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Node_function_name vs))
            (= ($FVF.lookup_Node_function_name vs x) ($FVF.lookup_Node_function_name ws x)))
          :pattern (($FVF.lookup_Node_function_name vs x) ($FVF.lookup_Node_function_name ws x))
          :qid |qp.$FVF<Node_function_name>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Node_function_name>To$Snap vs)
              ($SortWrappers.$FVF<Node_function_name>To$Snap ws)
              )
    :qid |qp.$FVF<Node_function_name>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Node_function_name pm r))
    :pattern (($FVF.perm_Node_function_name pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_Node_function_name f r) true)
    :pattern (($FVF.loc_Node_function_name f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun letvar@20@00 ($Snap $Ref $Ref) Int)
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (= (int___unbox__%limited s@$ box@0@00) (int___unbox__ s@$ box@0@00))
  :pattern ((int___unbox__ s@$ box@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (int___unbox__%stateless box@0@00)
  :pattern ((int___unbox__%limited s@$ box@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (let ((result@1@00 (int___unbox__%limited s@$ box@0@00))) (=>
    (and
      (int___unbox__%precondition s@$ box@0@00)
      (not (issubtype<Bool> (typeof<PyType> box@0@00) (as bool<PyType>  PyType))))
    (= (__prim__int___box__%limited $Snap.unit result@1@00) box@0@00)))
  :pattern ((int___unbox__%limited s@$ box@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (box@0@00 $Ref)) (!
  (let ((result@1@00 (int___unbox__%limited s@$ box@0@00))) (=>
    (and
      (int___unbox__%precondition s@$ box@0@00)
      (not (issubtype<Bool> (typeof<PyType> box@0@00) (as bool<PyType>  PyType))))
    (__prim__int___box__%precondition $Snap.unit result@1@00)))
  :pattern ((int___unbox__%limited s@$ box@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (prim@2@00 Int)) (!
  (=
    (__prim__int___box__%limited s@$ prim@2@00)
    (__prim__int___box__ s@$ prim@2@00))
  :pattern ((__prim__int___box__ s@$ prim@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (prim@2@00 Int)) (!
  (__prim__int___box__%stateless prim@2@00)
  :pattern ((__prim__int___box__%limited s@$ prim@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (prim@2@00 Int)) (!
  (let ((result@3@00 (__prim__int___box__%limited s@$ prim@2@00))) (=>
    (__prim__int___box__%precondition s@$ prim@2@00)
    (and
      (= (typeof<PyType> result@3@00) (as int<PyType>  PyType))
      (= (int___unbox__%limited $Snap.unit result@3@00) prim@2@00))))
  :pattern ((__prim__int___box__%limited s@$ prim@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (prim@2@00 Int)) (!
  (let ((result@3@00 (__prim__int___box__%limited s@$ prim@2@00))) true)
  :pattern ((__prim__int___box__%limited s@$ prim@2@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (prim@2@00 Int)) (!
  (let ((result@3@00 (__prim__int___box__%limited s@$ prim@2@00))) (=>
    (__prim__int___box__%precondition s@$ prim@2@00)
    (int___unbox__%precondition $Snap.unit result@3@00)))
  :pattern ((__prim__int___box__%limited s@$ prim@2@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref)) (!
  (= (list___len__%limited s@$ self@4@00) (list___len__ s@$ self@4@00))
  :pattern ((list___len__ s@$ self@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref)) (!
  (list___len__%stateless self@4@00)
  :pattern ((list___len__%limited s@$ self@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@17@00)
    (=>
      (list___len__%precondition s@$ self@4@00)
      (=
        (list___len__ s@$ self@4@00)
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> s@$)))))
  :pattern ((list___len__ s@$ self@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@4@00 $Ref)) (!
  true
  :pattern ((list___len__ s@$ self@4@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (self@6@00 Int) (other@7@00 Int)) (!
  (=
    (int___lt__%limited s@$ self@6@00 other@7@00)
    (int___lt__ s@$ self@6@00 other@7@00))
  :pattern ((int___lt__ s@$ self@6@00 other@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@6@00 Int) (other@7@00 Int)) (!
  (int___lt__%stateless self@6@00 other@7@00)
  :pattern ((int___lt__%limited s@$ self@6@00 other@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@6@00 Int) (other@7@00 Int)) (!
  (=>
    (int___lt__%precondition s@$ self@6@00 other@7@00)
    (= (int___lt__ s@$ self@6@00 other@7@00) (< self@6@00 other@7@00)))
  :pattern ((int___lt__ s@$ self@6@00 other@7@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (self@6@00 Int) (other@7@00 Int)) (!
  true
  :pattern ((int___lt__ s@$ self@6@00 other@7@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref) (key@10@00 $Ref)) (!
  (=
    (list___getitem__%limited s@$ self@9@00 key@10@00)
    (list___getitem__ s@$ self@9@00 key@10@00))
  :pattern ((list___getitem__ s@$ self@9@00 key@10@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (self@9@00 $Ref) (key@10@00 $Ref)) (!
  (list___getitem__%stateless self@9@00 key@10@00)
  :pattern ((list___getitem__%limited s@$ self@9@00 key@10@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (self@12@00 Int) (other@13@00 Int)) (!
  (=
    (int___ge__%limited s@$ self@12@00 other@13@00)
    (int___ge__ s@$ self@12@00 other@13@00))
  :pattern ((int___ge__ s@$ self@12@00 other@13@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@12@00 Int) (other@13@00 Int)) (!
  (int___ge__%stateless self@12@00 other@13@00)
  :pattern ((int___ge__%limited s@$ self@12@00 other@13@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (self@12@00 Int) (other@13@00 Int)) (!
  (=>
    (int___ge__%precondition s@$ self@12@00 other@13@00)
    (= (int___ge__ s@$ self@12@00 other@13@00) (>= self@12@00 other@13@00)))
  :pattern ((int___ge__ s@$ self@12@00 other@13@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (self@12@00 Int) (other@13@00 Int)) (!
  true
  :pattern ((int___ge__ s@$ self@12@00 other@13@00))
  :qid |quant-u-22|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- mcan_node_be_compressed ----------
(declare-const marked_execution_tree@0@01 $Ref)
(declare-const marked_execution_tree@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(marked_execution_tree.Node_children, write) &&
;   issubtype(typeof(marked_execution_tree.Node_children), list(Node()))
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= marked_execution_tree@1@01 $Ref.null)))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] issubtype(typeof(marked_execution_tree.Node_children), list(Node()))
; [eval] typeof(marked_execution_tree.Node_children)
; [eval] list(Node())
; [eval] Node()
(assert (issubtype<Bool> (typeof<PyType> ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))) (list<PyType> (as Node<PyType>  PyType))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(marked_execution_tree.Node_children.list_acc, write)
(declare-const $t@3@01 Seq<$Ref>)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall iii: Ref ::typeof(iii) == int() &&
;     (int___ge__(int___unbox__(iii), 0) &&
;     int___lt__(int___unbox__(iii), list___len__(marked_execution_tree.Node_children))) ==>
;     acc(list___getitem__(marked_execution_tree.Node_children, iii).Node_function_name, write))
(declare-const iii@4@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] typeof(iii) == int() && (int___ge__(int___unbox__(iii), 0) && int___lt__(int___unbox__(iii), list___len__(marked_execution_tree.Node_children)))
; [eval] typeof(iii) == int()
; [eval] typeof(iii)
; [eval] int()
(push) ; 4
; [then-branch: 0 | typeof[PyType](iii@4@01) != int[PyType] | live]
; [else-branch: 0 | typeof[PyType](iii@4@01) == int[PyType] | live]
(push) ; 5
; [then-branch: 0 | typeof[PyType](iii@4@01) != int[PyType]]
(assert (not (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | typeof[PyType](iii@4@01) == int[PyType]]
(assert (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType)))
; [eval] int___ge__(int___unbox__(iii), 0)
; [eval] int___unbox__(iii)
(push) ; 6
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(push) ; 7
(assert (not (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType)))
(assert (int___unbox__%precondition $Snap.unit iii@4@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
  (int___unbox__%precondition $Snap.unit iii@4@01)))
(push) ; 6
(assert (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0))
(pop) ; 6
; Joined path conditions
(assert (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0))
(push) ; 6
; [then-branch: 1 | !(int___ge__(_, int___unbox__(_, iii@4@01), 0)) | live]
; [else-branch: 1 | int___ge__(_, int___unbox__(_, iii@4@01), 0) | live]
(push) ; 7
; [then-branch: 1 | !(int___ge__(_, int___unbox__(_, iii@4@01), 0))]
(assert (not (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | int___ge__(_, int___unbox__(_, iii@4@01), 0)]
(assert (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0))
; [eval] int___lt__(int___unbox__(iii), list___len__(marked_execution_tree.Node_children))
; [eval] int___unbox__(iii)
(push) ; 8
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(pop) ; 8
; Joined path conditions
; [eval] list___len__(marked_execution_tree.Node_children)
(push) ; 8
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (< $k@5@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@5@01)))
(assert (<= (- $Perm.Write $k@5@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@5@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(push) ; 9
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(pop) ; 8
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (and
  (< $k@5@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@5@01))
  (<= (- $Perm.Write $k@5@01) $Perm.Write)
  (=>
    (< $Perm.No (- $Perm.Write $k@5@01))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
  (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(set-option :timeout 0)
(push) ; 8
(assert (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(pop) ; 8
; Joined path conditions
(assert (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (=>
  (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
  (and
    (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
    (< $k@5@01 $Perm.Write)
    (<= $Perm.No (- $Perm.Write $k@5@01))
    (<= (- $Perm.Write $k@5@01) $Perm.Write)
    (=>
      (< $Perm.No (- $Perm.Write $k@5@01))
      (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
    (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
    (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))))
(assert (or
  (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
  (not (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (=>
  (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
  (and
    (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
    (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
    (int___unbox__%precondition $Snap.unit iii@4@01)
    (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
    (=>
      (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
      (and
        (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
        (< $k@5@01 $Perm.Write)
        (<= $Perm.No (- $Perm.Write $k@5@01))
        (<= (- $Perm.Write $k@5@01) $Perm.Write)
        (=>
          (< $Perm.No (- $Perm.Write $k@5@01))
          (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
        (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
        (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
    (or
      (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
      (not (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0))))))
(assert (or
  (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
  (not (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType)))))
(assert (and
  (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
  (and
    (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
    (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))))
; [eval] list___getitem__(marked_execution_tree.Node_children, iii)
(push) ; 4
; [eval] issubtype(typeof(key), int())
; [eval] typeof(key)
; [eval] int()
(push) ; 5
(assert (not (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType)))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
(assert (<= (- $Perm.Write $k@6@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@6@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (let ln == (list___len__(self)) in (int___unbox__(key) < 0 ==> int___unbox__(key) >= -ln) && (int___unbox__(key) >= 0 ==> int___unbox__(key) < ln))
; [eval] list___len__(self)
(set-option :timeout 0)
(push) ; 5
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(assert (<= (- $Perm.Write $k@7@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@7@01))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null))))
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
(pop) ; 5
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (<= (- $Perm.Write $k@7@01) $Perm.Write)
  (=>
    (< $Perm.No (- $Perm.Write $k@7@01))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
  (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
(declare-fun letvar@8@01 ($Ref) Int)
(assert (=
  (letvar@8@01 iii@4@01)
  (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
; [eval] (int___unbox__(key) < 0 ==> int___unbox__(key) >= -ln) && (int___unbox__(key) >= 0 ==> int___unbox__(key) < ln)
; [eval] int___unbox__(key) < 0 ==> int___unbox__(key) >= -ln
; [eval] int___unbox__(key) < 0
; [eval] int___unbox__(key)
(set-option :timeout 0)
(push) ; 5
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(assert (int___unbox__%precondition $Snap.unit iii@4@01))
(pop) ; 5
; Joined path conditions
(assert (int___unbox__%precondition $Snap.unit iii@4@01))
(push) ; 5
; [then-branch: 2 | int___unbox__(_, iii@4@01) < 0 | live]
; [else-branch: 2 | !(int___unbox__(_, iii@4@01) < 0) | live]
(push) ; 6
; [then-branch: 2 | int___unbox__(_, iii@4@01) < 0]
(assert (< (int___unbox__ $Snap.unit iii@4@01) 0))
; [eval] int___unbox__(key) >= -ln
; [eval] int___unbox__(key)
(push) ; 7
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(pop) ; 7
; Joined path conditions
; [eval] -ln
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(int___unbox__(_, iii@4@01) < 0)]
(assert (not (< (int___unbox__ $Snap.unit iii@4@01) 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< (int___unbox__ $Snap.unit iii@4@01) 0))
  (< (int___unbox__ $Snap.unit iii@4@01) 0)))
(push) ; 5
; [then-branch: 3 | !(int___unbox__(_, iii@4@01) < 0 ==> int___unbox__(_, iii@4@01) >= 0 - list___len__($t@3@01, First:($t@2@01))) | live]
; [else-branch: 3 | int___unbox__(_, iii@4@01) < 0 ==> int___unbox__(_, iii@4@01) >= 0 - list___len__($t@3@01, First:($t@2@01)) | live]
(push) ; 6
; [then-branch: 3 | !(int___unbox__(_, iii@4@01) < 0 ==> int___unbox__(_, iii@4@01) >= 0 - list___len__($t@3@01, First:($t@2@01)))]
(assert (not
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | int___unbox__(_, iii@4@01) < 0 ==> int___unbox__(_, iii@4@01) >= 0 - list___len__($t@3@01, First:($t@2@01))]
(assert (=>
  (< (int___unbox__ $Snap.unit iii@4@01) 0)
  (>=
    (int___unbox__ $Snap.unit iii@4@01)
    (-
      0
      (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))))
; [eval] int___unbox__(key) >= 0 ==> int___unbox__(key) < ln
; [eval] int___unbox__(key) >= 0
; [eval] int___unbox__(key)
(push) ; 7
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(pop) ; 7
; Joined path conditions
(push) ; 7
; [then-branch: 4 | int___unbox__(_, iii@4@01) >= 0 | live]
; [else-branch: 4 | !(int___unbox__(_, iii@4@01) >= 0) | live]
(push) ; 8
; [then-branch: 4 | int___unbox__(_, iii@4@01) >= 0]
(assert (>= (int___unbox__ $Snap.unit iii@4@01) 0))
; [eval] int___unbox__(key) < ln
; [eval] int___unbox__(key)
(push) ; 9
; [eval] issubtype(typeof(box), int())
; [eval] typeof(box)
; [eval] int()
(pop) ; 9
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 4 | !(int___unbox__(_, iii@4@01) >= 0)]
(assert (not (>= (int___unbox__ $Snap.unit iii@4@01) 0)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (>= (int___unbox__ $Snap.unit iii@4@01) 0))
  (>= (int___unbox__ $Snap.unit iii@4@01) 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
  (and
    (=>
      (< (int___unbox__ $Snap.unit iii@4@01) 0)
      (>=
        (int___unbox__ $Snap.unit iii@4@01)
        (-
          0
          (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
    (or
      (not (>= (int___unbox__ $Snap.unit iii@4@01) 0))
      (>= (int___unbox__ $Snap.unit iii@4@01) 0)))))
(assert (or
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
  (not
    (=>
      (< (int___unbox__ $Snap.unit iii@4@01) 0)
      (>=
        (int___unbox__ $Snap.unit iii@4@01)
        (-
          0
          (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))))))
(push) ; 5
(assert (not (and
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
  (=>
    (>= (int___unbox__ $Snap.unit iii@4@01) 0)
    (<
      (int___unbox__ $Snap.unit iii@4@01)
      (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (and
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
  (=>
    (>= (int___unbox__ $Snap.unit iii@4@01) 0)
    (<
      (int___unbox__ $Snap.unit iii@4@01)
      (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))))
(assert (list___getitem__%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii@4@01))
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
  (< $k@6@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@6@01))
  (<= (- $Perm.Write $k@6@01) $Perm.Write)
  (=>
    (< $Perm.No (- $Perm.Write $k@6@01))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (<= (- $Perm.Write $k@7@01) $Perm.Write)
  (=>
    (< $Perm.No (- $Perm.Write $k@7@01))
    (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
  (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
  (=
    (letvar@8@01 iii@4@01)
    (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
  (int___unbox__%precondition $Snap.unit iii@4@01)
  (or
    (not (< (int___unbox__ $Snap.unit iii@4@01) 0))
    (< (int___unbox__ $Snap.unit iii@4@01) 0))
  (=>
    (=>
      (< (int___unbox__ $Snap.unit iii@4@01) 0)
      (>=
        (int___unbox__ $Snap.unit iii@4@01)
        (-
          0
          (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
    (and
      (=>
        (< (int___unbox__ $Snap.unit iii@4@01) 0)
        (>=
          (int___unbox__ $Snap.unit iii@4@01)
          (-
            0
            (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
      (or
        (not (>= (int___unbox__ $Snap.unit iii@4@01) 0))
        (>= (int___unbox__ $Snap.unit iii@4@01) 0))))
  (or
    (=>
      (< (int___unbox__ $Snap.unit iii@4@01) 0)
      (>=
        (int___unbox__ $Snap.unit iii@4@01)
        (-
          0
          (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
    (not
      (=>
        (< (int___unbox__ $Snap.unit iii@4@01) 0)
        (>=
          (int___unbox__ $Snap.unit iii@4@01)
          (-
            0
            (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
  (=>
    (< (int___unbox__ $Snap.unit iii@4@01) 0)
    (>=
      (int___unbox__ $Snap.unit iii@4@01)
      (-
        0
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
  (=>
    (>= (int___unbox__ $Snap.unit iii@4@01) 0)
    (<
      (int___unbox__ $Snap.unit iii@4@01)
      (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
  (list___getitem__%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii@4@01)))
(pop) ; 3
(declare-const $t@9@01 $FVF<Node_function_name>)
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@5@01))
(assert ($Perm.isReadVar $k@6@01))
(assert ($Perm.isReadVar $k@7@01))
; Nested auxiliary terms: non-globals
(assert (forall ((iii@4@01 $Ref)) (!
  (=>
    (and
      (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
      (and
        (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
        (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
    (and
      (=>
        (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
        (and
          (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
          (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
          (int___unbox__%precondition $Snap.unit iii@4@01)
          (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
          (=>
            (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
            (and
              (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
              (< $k@5@01 $Perm.Write)
              (<= $Perm.No (- $Perm.Write $k@5@01))
              (<= (- $Perm.Write $k@5@01) $Perm.Write)
              (=>
                (< $Perm.No (- $Perm.Write $k@5@01))
                (not
                  (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
              (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
              (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
          (or
            (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)
            (not (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii@4@01) 0)))))
      (or
        (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
        (not (= (typeof<PyType> iii@4@01) (as int<PyType>  PyType))))
      (issubtype<Bool> (typeof<PyType> iii@4@01) (as int<PyType>  PyType))
      (< $k@6@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@6@01))
      (<= (- $Perm.Write $k@6@01) $Perm.Write)
      (=>
        (< $Perm.No (- $Perm.Write $k@6@01))
        (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
      (< $k@7@01 $Perm.Write)
      (<= $Perm.No (- $Perm.Write $k@7@01))
      (<= (- $Perm.Write $k@7@01) $Perm.Write)
      (=>
        (< $Perm.No (- $Perm.Write $k@7@01))
        (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) $Ref.null)))
      (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
      (=
        (letvar@8@01 iii@4@01)
        (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))
      (int___unbox__%precondition $Snap.unit iii@4@01)
      (or
        (not (< (int___unbox__ $Snap.unit iii@4@01) 0))
        (< (int___unbox__ $Snap.unit iii@4@01) 0))
      (=>
        (=>
          (< (int___unbox__ $Snap.unit iii@4@01) 0)
          (>=
            (int___unbox__ $Snap.unit iii@4@01)
            (-
              0
              (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
        (and
          (=>
            (< (int___unbox__ $Snap.unit iii@4@01) 0)
            (>=
              (int___unbox__ $Snap.unit iii@4@01)
              (-
                0
                (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
          (or
            (not (>= (int___unbox__ $Snap.unit iii@4@01) 0))
            (>= (int___unbox__ $Snap.unit iii@4@01) 0))))
      (or
        (=>
          (< (int___unbox__ $Snap.unit iii@4@01) 0)
          (>=
            (int___unbox__ $Snap.unit iii@4@01)
            (-
              0
              (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
        (not
          (=>
            (< (int___unbox__ $Snap.unit iii@4@01) 0)
            (>=
              (int___unbox__ $Snap.unit iii@4@01)
              (-
                0
                (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
      (=>
        (< (int___unbox__ $Snap.unit iii@4@01) 0)
        (>=
          (int___unbox__ $Snap.unit iii@4@01)
          (-
            0
            (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
      (=>
        (>= (int___unbox__ $Snap.unit iii@4@01) 0)
        (<
          (int___unbox__ $Snap.unit iii@4@01)
          (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))))
      (list___getitem__%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii@4@01)))
  :pattern ((list___getitem__ ($Snap.combine
    $Snap.unit
    ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii@4@01))
  :qid |Node_function_name-aux|)))
; Check receiver injectivity
(assert (forall ((iii1@4@01 $Ref) (iii2@4@01 $Ref)) (!
  (and
    (=>
      (= (typeof<PyType> iii1@4@01) (as int<PyType>  PyType))
      (and
        (and
          (int___unbox__%precondition $Snap.unit iii1@4@01)
          (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) 0))
        (=>
          (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) 0)
          (and
            (int___unbox__%precondition $Snap.unit iii1@4@01)
            (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
            (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
    (=>
      (and
        (= (typeof<PyType> iii1@4@01) (as int<PyType>  PyType))
        (and
          (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) 0)
          (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
      (and
        (=>
          (= (typeof<PyType> iii2@4@01) (as int<PyType>  PyType))
          (and
            (and
              (int___unbox__%precondition $Snap.unit iii2@4@01)
              (int___ge__%precondition $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) 0))
            (=>
              (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) 0)
              (and
                (int___unbox__%precondition $Snap.unit iii2@4@01)
                (list___len__%precondition ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)))
                (int___lt__%precondition $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))))
        (=>
          (and
            (= (typeof<PyType> iii2@4@01) (as int<PyType>  PyType))
            (and
              (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) 0)
              (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
          (and
            (list___getitem__%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii1@4@01)
            (list___getitem__%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii2@4@01))))))
  
  :qid |Node_function_name-rcvrInj|)))
(push) ; 3
(assert (not (forall ((iii1@4@01 $Ref) (iii2@4@01 $Ref)) (!
  (=>
    (and
      (and
        (= (typeof<PyType> iii1@4@01) (as int<PyType>  PyType))
        (and
          (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) 0)
          (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii1@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
      (and
        (= (typeof<PyType> iii2@4@01) (as int<PyType>  PyType))
        (and
          (int___ge__ $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) 0)
          (int___lt__ $Snap.unit (int___unbox__ $Snap.unit iii2@4@01) (list___len__ ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01))))))
      (=
        (list___getitem__ ($Snap.combine
          $Snap.unit
          ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii1@4@01)
        (list___getitem__ ($Snap.combine
          $Snap.unit
          ($Snap.combine ($SortWrappers.Seq<$Ref>To$Snap $t@3@01) $Snap.unit)) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@2@01)) iii2@4@01)))
    (= iii1@4@01 iii2@4@01))
  
  :qid |Node_function_name-rcvrInj|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
