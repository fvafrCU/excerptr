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

```r
help("excerptr-package", package = "excerptr")
```

```
## Excerpt Structuring Comments from Your Code File and Set a Table of
## Contents
## 
## Description:
## 
##      This is just an R interface to the python package excerpts (<URL:
##      https://pypi.python.org/pypi/excerpts>).
## 
## Details:
## 
##      You will probably only want to use 'excerptr', see there for a
##      usage example.
## 
## Author(s):
## 
##      Andreas Dominik Cullmann, <adc-r@arcor.de>
```

## System Requirements
excerptr needs [python3](https://www.python.org/download/releases/3.0/).

## Installation

### Unix
Install [the rPython package](https://cran.r-project.org/package=rPython), see 
file [INSTALL](https://cran.r-project.org/package=rPython/INSTALL) there.

### Windows
Install [rPython-win](https://github.com/cjgb/rPython-win)
(follow the instructions at 
[https://cran.r-project.org/web/packages/rPython/INSTALL](https://cran.r-project.org/package=rPython/INSTALL)
).

### Both
Install excerptr from github

```r
if (! require("devtools")) install.packages("devtools")
devtools::install_github("fvafrCU/excerptr", quiet = TRUE)
```

or [CRAN](https://cran.r-project.org/package=excerptr)

```r
install.packages("excerptr")
```

