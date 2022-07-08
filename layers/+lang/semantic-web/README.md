![](img/semweb.png)

Description
===========

This layer adds support for RDF files in N3 and [Turtle
syntax](https://www.w3.org/TR/turtle/) using
[ttl-mode](https://github.com/nxg/ttl-mode) and for
[SPARQL](https://www.w3.org/TR/sparql11-query/) queries using
[sparql-mode](https://github.com/ljos/sparql-mode).

SPARQL-mode supports the execution of queries. When first called, you
will be prompted for a SPARQL HTTP endpoint in the minibuffer, which
defaults to <http://localhost:2020/>. Once set, it will be used for all
subsequent queries in that buffer. Results will be displayed in another
buffer in CSV format.

Features:
---------

-   Provides an alternative way to search the web using SPARQL queries.

Install
=======

To use this configuration layer, add it to your `~/.spacemacs`. You will
need to add `semantic-web` to the existing
`dotspacemacs-configuration-layers` list in this file.

Key bindings
============

  Key binding   Description
  ------------- ----------------------
  `SPC m q`     Execute SPARQL query
