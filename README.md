<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/fvafrCU/excerptr.svg?branch=master)](https://travis-ci.org/fvafrCU/excerptr)
[![Coverage Status](https://codecov.io/github/fvafrCU/excerptr/coverage.svg?branch=master)](https://codecov.io/github/fvafrCU/excerptr?branch=master)

# excerptr
This is an R interface to [excerpts](https://pypi.python.org/pypi/excerpts).

## Introduction

Please read the [vignette.](http://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)

<!-- vignette. Either [the version on github](http://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)
or [the one released on cran](https://cran.r-project.org/web/packages/excerptr/vignettes/excerptr_Introduction.html). -->

Or, after installation, the help page:
<blockquote>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>R: Excerpt Structuring Comments from Your Code File and Set a...</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="R.css" />
</head><body>

<table width="100%" summary="page for excerptr-package"><tr><td>excerptr-package</td><td style="text-align: right;">R Documentation</td></tr></table>

<h2>Excerpt Structuring Comments from Your Code File and Set a Table of Contents</h2>

<h3>Description</h3>

<p>This is an R interface to the 
Python package excerpts (<a href="https://pypi.python.org/pypi/excerpts">https://pypi.python.org/pypi/excerpts</a>).
</p>


<h3>Author(s)</h3>

<p>Andreas Dominik Cullmann, &lt;adc-r@arcor.de&gt;
</p>


</body></html>
</blockquote>

## Installation
You can install excerptr from github with:

```r
if (! require("devtools")) install.packages("devtools")
devtools::install_github("fvafrCU/excerptr", quiet = TRUE)
```


## System Requirements
You need

  - [python3](https://www.python.org/download/releases/3.0/)
  - [the rPython package](https://cran.r-project.org/package=rPython), for windows see [here](https://github.com/cjgb/rPython-win)

And you might want to install [pandoc](https://www.pandoc.org/).
