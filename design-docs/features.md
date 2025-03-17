# Features
*Italics*: planned/possible features.
## Parser
- accepts Z3 4.12 trace files.
- can handle the following line cases:
    - `version-info`
    - `mk-quant`/`mk-lambda` 
    - `mk-var`
    - `mk-proof`/`mk-app`
    - `attach-meaning`
    - `attach-vars`
    - `attach-enode`
    - `eq-expl`
    - `new-match`
    - `inst-discovered`
    - `instance`
    - `end-of-instance`
    - `eof`
- *other line cases can be handled by creating a new implementation of Z3LogParser, or modifying the one(s) in the project*
- prints formatted representations of the collections for terms, quantifiers, instantiations, equality explanations, instantiation dependencies.
- outputs the instantiation graph in Dot format.
- calls Graphviz's `dot` program to render Dot output as an SVG.
- *support other kinds of visualizations/SVG implementations*
- *support parsers for different SMT solvers*
### Settings:
- Sorting:
    - by line number
    - by instantiation cost
    - *by subgraph height*
    - *by number of child nodes*
    - *by subgraph size*
    - *by longest path*
- Filtering:
    - exclude theory-solving instantiations from graph
    - maximum number of instantiations to display
- Early stopping
    - timeout
    - *up to line number*
    - *remotely* (need to add HTTP endpoint(s) and Yew functionality)
- *Keep all reuses of same term identifiers*
### Advanced potential features
- *matching loop detection*
- *accepting SMT2 files directly, running them through a solver and then parsing the resulting trace files*
- *proof reconstruction? - use other data/line cases*
## Actix-Web server 
(see `architecture.md` for endpoints and planned endpoints)
- do a sample parsing run
- parse a submitted log file and send resulting SVG back

## Yew GUI
- load in a log file from Z3
- click button to send request to parser
- graph appears on page once response arrives

- *shows pretty-printed information for each instantiation when their respective node is clicked*
    - *bound terms, blamed terms, equalities (like Axiom Profiler)*
- *can query for specific information from parser*
- *hide and unhide certain nodes/children from graph*
- *download and save information files*
- *specify max depth, max size of SVG*
- *specify early stop conditions (timeout, line number, manual stop)*- *progress bar, other progress info*