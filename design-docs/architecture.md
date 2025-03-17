# Parser
- takes Z3 trace files and runs through their content
- create parser object
- parser object fields used for data
- saves potentially useful data structures to files
- traits to more easily support different implementations of various parts
- `main`: entry point
 -> `parsers`, `parsers/z3parser1`: parsing and saving results to file
 -> `dot_output`: outputting Dot and CSS
 -> `css`: picking colours and putting CSS together
 -> `render`: Call Graphviz's dot to render SVG
 -> `parsers` returns SVG
(names may change)

# Actix-web server
- handles HTTP requests from Yew frontend
- cross-origin resource sharing (CORS) settings needed because it cannot use the same port as Yew, making it a different origin in web terms.
- *alternative server protocol: Websockets* (https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)
- `POST /parse`
    - body: contents of a trace file
    This 
- `GET /sample` - run an example
## New endpoints (not yet implemented):
- `POST /results` (provide file name, text, settings; returns an ID)
- `GET /results/:id` - returns progress, and full data if complete
(early stop setting)
- `GET /results` - all result entries on backend
- `GET /trace` - all trace files
- `GET /trace/:id` - get a previously parsed trace file
- `GET /results/:id/data` ... get specific pieces of data, e.g.:
    - `/results/:id/instantiations/:id2`
    - `.../terms/:id2`
    - `.../quantifiers/:id2`, etc.

# Yew frontend (current)
- load in file; sent to server via HTTP request
- gets response as a string, injects SVG into the page HTML and re-renders
