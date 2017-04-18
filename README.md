---
output: github_document
---
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/fvafrCU/excerptr.svg?branch=master)](https://travis-ci.org/fvafrCU/excerptr)
[![Coverage Status](https://codecov.io/github/fvafrCU/excerptr/coverage.svg?branch=master)](https://codecov.io/github/fvafrCU/excerptr?branch=master)

# excerptr
This is an R interface to [excerpts](https://pypi.python.org/pypi/excerpts).

## Introduction

Please read the vignette. Either [the version on github](http://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)
or [the one released on cran](https://cran.r-project.org/web/packages/excerptr/vignettes/excerptr_Introduction.html) .

Or, after installation, the help page:

```r
options(pager = "/bin/cat")
help("excerptr-package", package = "excerptr")
```

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
