---
title: "An Introduction to excerptr"
author: "Andreas Dominik Cullmann"
date: 2017-05-01, 21:59:20
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{An Introduction to excerptr}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---
excerptr is an R interface to the python package [excerpts](https://pypi.python.org/pypi/excerpts).
See there for more on the Why.

Suppose you have a script


```r
path <- system.file("tests", "files", "some_file.R", package = "excerptr")
cat(readLines(path), sep = "\n")
```

```
#######% % All About Me
#######% % Me
####### The above defines a pandoc markdown header.
####### This is more text that will not be extracted.
#######% **This** is an example of a markdown paragraph: markdown 
#######% recognizes only six levels of heading, so we use seven or
#######% more levels to mark "normal" text.
#######% Here you can use the full markdown 
#######% [syntax](http://daringfireball.net/projects/markdown/syntax).
#######% *Note* the trailing line: markdown needs an empty line to end
#######% a paragraph.
#######%

#% A section
##% A subsection
### Not a subsubsection but a plain comment.
############% Another markdown paragraph.
############%
####### More text that will not be extracted.
```
and you would want to excerpt the comments marked by '%' into a file giving you the table of contents of your script.
Then 

```r
excerptr::excerptr(file_name = path, run_pandoc = FALSE, output_path = tempdir())
```

```
## [1] 0
```
gives you


```r
cat(readLines(file.path(tempdir(), sub("\\.R$", ".md", basename(path)))), 
    sep = "\n")
```

```
% All About Me
% Me
**This** is an example of a markdown paragraph: markdown 
recognizes only six levels of heading, so we use seven or
more levels to mark "normal" text.
Here you can use the full markdown 
[syntax](http://daringfireball.net/projects/markdown/syntax).
*Note* the trailing line: markdown needs an empty line to end
a paragraph.

# A section
## A subsection
Another markdown paragraph.
```

If you have pandoc installed, you can convert the markdown output into html:






