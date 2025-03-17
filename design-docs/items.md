## items
Contains the definitions of and implementations for the main structs and data structures used in parsing.

### `pub trait Print: Debug`
trait needed for pretty printing
### `pub struct Term`
represents a Z3 term (the result of a `[mk-app]` line). 

### `pub struct Quantifier`
represents a quantifier (resulting from a `[mk-quant]` or `[mk-lambda]` line).

### `pub struct Instantiation`
represents an instantiation; could be a quantifier instantiation or a theory-based one (resulting from `[new-match]` or `[instance-discovered]` lines, updated with `[instance]`)

### `pub struct BlamedTermItem`
Either a single String or two Strings (represnting term IDs). Single is any standalone blamed term (top-level?), while any two IDs in parentheses (#A #B) is represented

### `pub fn parse_id`
Splits ID into a string namespace and numerical ID number. If the term doesn't have a number, 0 is used. Makes it easier to get terms in sorted order.

### `pub struct TwoDMap<V>`
The data structure for Terms and Quantifiers. Consists of a Map of Maps; the first layer is the namespace ("" for general terms, "datatype", "arith", etc.; while).

Has `insert`, `get` and `get_mut` methods based on terms' full IDs (namespace and number).

### `pub enum DepType`
Represents whether a dependency is based on a general term or an equality, or is not actually a dependency (if it is "from" line 0, simply to denote a node with no dependency).

### `pub struct Dependency`
A dependency between two instantiations; represented by line numbers and other info such as DepType, the blamed term and quantifier.

### `pub enum EqualityExpl`
An equality explanation. Stores the information on the `[eq-expl]` line.