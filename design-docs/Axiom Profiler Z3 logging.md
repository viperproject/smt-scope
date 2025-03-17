# LogProcessor.ParseTraceLine behaviour

## Cases (`words[0]`):
*: skipped or does nothing if interestedInCurrentCheck is false

!: important

### [tool-version]
Checks that log is from Z3 and that the Z3 version number `x.y.z` follows `x >= 4`, `y >= 8`, `z >= 5` (this is a bug; can be fixed by correcting the condition) 

### [mk-quant]!, [mk-lambda]! (same result)
Creates a quantifier; 
`words[1]` specifies the namespace and identifier number, `words[2]` specifies the name, `words[3]` is the number of variables (qvars), the last word is the body and any other term IDs before the last are patterns/triggers (if only `words[4]` exists, the quantifier has just a body).
Sets the qvars' `bindingQuantifier` field.

Calls `LoadBoogieToken`, but it does not seem to actually do anything (due to the regex match not succeeding).

### [mk-var]!
Creates a variable with identifier being `words[1]` and name being `words[2]`. "`qvar_`" is added to the start of the name.

### [mk-proof]!
Copies the last term in the line, called `t`, into the model. If the type of the proof step (`words[2]`) is one of the following, take the `to` and `from` parts of `t` (should be an = term) and then:
- monotonicity: adds TransitiveEqualityExplanations based on the child terms of `from` and `to` (each child term of `from` corresponds with one of `to`) and puts them in a CongruenceExplanation. Adds the arguments to reverseMonotonicitySteps (`to` is key, `from` is value).
- rewrite: adds a DirectEqualityExplanation containing `t`, `to` and `from`. Adds the arguments to reverseMonotonicitySteps (`to` is key, `from` is value).

### [mk-app]!
Creates a new term based on the given identifier, name/symbol, and given child terms if applicable.
Adds new term to the child terms' lists of dependent terms.

### [attach-meaning]!
Adds theory and name to a variable (e.g. arith, 0).

### [attach-var-names]!
Adds variable and sort names to the quantifier with the given identifier and renames the `qvar` variables (terms with ID -1) in the quantifier. If no variable names aregiven, the default `qvar_0`, `qvar_1`... names are used instead.

### [attach-enode]
Marks a term as dependent on the last instantiation (considered the responsible instantiation), so that any following instantiations can be properly linked to. `words[2]` (number following identifier) is unused.

If term already has a responsible instantiation, create a new copy of the term with no dependent terms or instantiations. Makes `lastInst` the responsible instantiation and adds the term to `lastInst`'s dependent terms.

Checks if `bodyTerm` (last instantiation's `concreteBody`) is a subterm of `t`; if not, queries reverseMonotonicitySteps until it finds a subterm  of `t` or gets null. If it finds a subterm, does `AttachEnode` on it.
AttachEnode to followed term (reverseMonotonicitySteps)...

### [eq-expl]! check?
https://github.com/Z3Prover/z3/wiki/Equality-Explanation-Logging
Represents an equality explanation found by Z3?
Type of equality explanation is given by `words[2]`.
- `root`: Removes equality explanation fromId if it is in model, otherwise do nothing. (Purpose may be to remove equality explanations with old terms that reused a number)
- `lit`: Create a TheoryEqualityExplanation if `words[1]` term is the same as the `words[3]` term, otherwise a DirectEqualityExplanation
- `cg`: CongruenceEqualityExplanation, using (#A #B) provided as argument equality explanations
- `ax`: Creates a TransitiveEqualityExplanation containing an emptyEqualityExplanation
- `th`: Creates a TheoryEqualityExplanation using `words[3]`

### [new-match]*! TODO?
Lists instantiation information in this order: Fingerprint, quantifier ID, pattern ID, bound terms' IDs; blamed terms IDs
Blamed terms may appear in pairs as parentheses (#A #B) - denotes equality being used?
`Instantiation.bindingInfo.BlamedEffectiveTerms`.
Adds entry to `model.fingerprints`. `bindingInfo.bindings` shows the terms in the pattern, `patternMatchContext` lists identifiers of the pattern and its subterms.

### [inst-discovered]!
Line lists: Method, fingerprint, theory; blamed terms.
Puts instantiation into `model.fingerprints`.
Seems to only ever involve theory-solving, not quantifier instantiations.

### [instance]*!
Line lists: Fingerprint, resulting term (quantifier body); `Z3Generation`.
A 16-digit hexadecimal fingerprint (0 for theory-solving), and the resulting term from the instantiation. The depth of the instantiation, if applicable, is after a semicolon.
If the quantifier body is an OR, it goes through `GetBodyFromImplication`. 
Child terms that are negated FORALLs are filtered out and the instantiation's `concreteBody` is an OR of the remaining terms (if just one term, no OR is used).
Otherwise, the quantifier body is used directly as the instantiation's `concreteBody`.
AddInstance: sets up instance information, adds it to stack, model and quantifier's list of instantiations.
For each responsible term, connect inst and previous instantiations both ways by considering every responsible term's responsible instantiations. Add inst to every responsible/binding term's dependent instantiations (blame/bind respectively).

### [end-of-instance]*
Pops most recent instance from `lastInstStack`; if unbalanced, throw an exception.

### [decide-and-or]*
Sets `decideClause` to term with ID `words[1]`.

### [decide] (unused)
Does nothing, has comment `// we’re getting [assign] anyhow`

### [assign] (unused)
This case and most of the below cases are skipped due to skipDecisions being true.

### [push]* (unused)
Pushes a scope onto model based on beginCheckSeen?

### [pop]* (unused)
Pops a scope from model?

### [begin-check]
If checkToConsider != 0, changes interestedInCurrentCheck based on whether checkToConsider == beginCheckSeen
Assumes check numbers are consecutive (1, 2, 3, 4, ...).

### [query-done]*
Updates eofSeen if interestedInCurrentCheck and checkToConsider > 0.

### [eof]
Updates eofSeen.

### [resolve-process]* (unused)

### [resolve-lit]* (unused)
Creates a new ResolutionLiteral

### [conflict]* (unused)
Creates a new `Conflict`, increases `cnflCount`, adds conflict to model...