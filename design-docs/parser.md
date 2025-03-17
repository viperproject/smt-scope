Steps
1. Initializes all the main data structures

2. Sets up regexes

3. Reads from env vars and settings

4. Parsing

5. Saves data to files

6. Output dot file

7. Call `dot` command to generate SVG from Graphviz

Instantiation recording process
- terms/proof lines, variables, quantifiers, equality explanations are all recorded as they are found
- attach-var-names: will name quantified variables in quantifiers; should reflect in pretty-printing

- `[mk_proof]/[mk-app]` Creates a term with given ID, type, and child/dependent terms. The new term is added to the children's lists of yielded terms. Text for term is constructed out of immediate child terms.
Does not distinguish between proofs and apps as they can be processed the same. There could be separate logic for proofs that happen when they are recorded, just as the Axiom Profiler does.

- `[mk-var]`: Similar to `[mk-app]`, but simpler as there are no child terms

- `[mk-quant]`: Must do the same thing as `[mk-app]`, but also keep track of variables and add a Quantifier.

- `[attach-enode]`: Does nothing if not in an instance block. Links the term to the current instantiation (top of `inst_stack`); if the term is blamed in a later instantiation, there will be a dependency between the two instantiations. Ignores the extra number (Z3 generation of the term?).

- `[eq-expl]`: records an equality explanation. Needs to determine which type it is.
root: trivial

th: trivial, as it is based on a theory

lit: based on an explicit = term; can check if = was added to e-graph (`attach-enode`) by an instantiation

cg: need to check each argument equality (pair of terms in parentheses, e.g. `(#A #B)`). Some argument equalities are the same term twice and don't need to be checked; while other equalities may depend on a chain of other `lit`, `cg`, `th` equality explanations. The two terms may not have a direct equality explanation sequence but should at least share the same `root`. This is the most complex case; equality (and hence instantiation) dependencies can be copied recursively.

ax, unknown: not seen


- `[new-match]`:

    This is seen when a match for a quantifier instantiation appears.
    Find position of semicolon; this separates blamed terms.
    Get quant ID, pattern ID, blamed term, bound terms.
    We read bound terms as `BlamedTermItems`. If singular, we check for a dependency; otherwise we check the first term for a match with an equality.
    We insert a match containing partial instantiation information; the actual resulting term, instance line, and yields terms will not be known at this time, and some matches will not be instantiated.
- `[instance-discovered]`:

    Seen for other instantiations, mainly theory-solving instantiations, but also MBQIs. These are handled with separate cases.
    Names the theory, fingerprint (which is 0 for theory solving), and gives a blamed/bound term.
- `[instance]`:

    This is seen when an instance is actually created based on a previous match line. Marks the start of an instance block; any log lines between this one and `[end of instance]` are understood to be part of that instance.
    To properly keep track of dependencies between QIs, each of the terms associated with an `[attach-enode]` line must be tracked.
    Updates the line number of the instantiation to be the same as that of the `[instance]` line.
    Adds instance to the stack of instances.

- `[end-of-instance]`:
    Denotes the end of an instance block. 

Old method:
Instantiations were kept in a single BTreeMap with (fingerprint: instantiation) format. The fingerprint would be obtained when a match is found. Matches would contain partial instantiation information; quantifier, pattern, bound terms and blamed terms.
The instance would add the resulting term, update the line number (previously considered the match line), and then add in any dependent terms (resulting from `[attach-enode]` lines)

Matches log fingerprints; instantiations for final data

Instantiations is the one to rely on for actual terms

Deals with reuse of fingerprints, unused matches, nested instantiations


## Alternate data structures and considerations

- Indirection and "simple types" - Using String IDs to represent terms, line numbers; then trying to do lookups. 
(Can't hold & references because mutation needed later). Still some trouble because have to borrow entire collections at once.
- `Rc` and `RefCell`: this may make retrieving and modifying collection (Vec/HashMap/BTreeMap) elements easier, but is also more complicated. Also allows structs to own others that are placed in a collection. May save memory due to not needing clones?


