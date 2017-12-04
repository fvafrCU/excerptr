<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/fvafrCU/excerptr.svg?branch=master)](https://travis-ci.org/fvafrCU/excerptr)
[![Coverage Status](https://codecov.io/github/fvafrCU/excerptr/coverage.svg?branch=master)](https://codecov.io/github/fvafrCU/excerptr?branch=master)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/excerptr)](https://cran.r-project.org/package=excerptr)
[![RStudio_downloads_monthly](https://cranlogs.r-pkg.org/badges/excerptr)](https://cran.r-project.org/package=excerptr)
[![RStudio_downloads_total](https://cranlogs.r-pkg.org/badges/grand-total/excerptr)](https://cran.r-project.org/package=excerptr)


# excerptr
This is an R interface to [excerpts](https://pypi.python.org/pypi/excerpts).

## Introduction

Please read the [vignette.](https://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)

<!-- vignette. Either [the version on github](https://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)
or [the one released on cran](https://cran.r-project.org/packages=excerptr/vignettes/excerptr_Introduction.html). -->

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
##      usage example. All other functions documented are rather meant for
##      internal use.
```

## System Requirements
excerptr needs [python3](https://www.python.org/download/releases/3.0/),
you probably want to have [pandoc](https://www.pandoc.org/) and a TeX-System such as 
[TeXLive](https://www.tug.org/texlive/) installed.

## Installation

### Unix
Install [the rPython package](https://cran.r-project.org/package=rPython), see 
file [INSTALL](https://cran.r-project.org/package=rPython/INSTALL) there, or use the following code:

```r
download.file("https://raw.githubusercontent.com/fvafrCU/cuutils/master/R/install_cran.R", 
              tmpf <- tempfile())
source(tmpf)
install_cran("rPython")
```
then install excerptr from [CRAN](https://cran.r-project.org/package=excerptr)

```r
install.packages("excerptr")
```

### Windows
Install [rPython-win](https://github.com/cjgb/rPython-win)
(following the instructions at 
[https://cran.r-project.org/package=rPython/INSTALL](https://cran.r-project.org/package=rPython/INSTALL)
), or use the following code:

```r
download.file("https://raw.githubusercontent.com/fvafrCU/cuutils/master/R/install_cran.R", 
              tmpf <- tempfile())
source(tmpf)
install_cran("rPython")
```
Then install excerptr:

```r
download.file("https://raw.githubusercontent.com/fvafrCU/cuutils/master/R/install_cran.R", 
              tmpf <- tempfile())
source(tmpf)
install_cran("excerptr")
```



