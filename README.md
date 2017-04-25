<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/fvafrCU/excerptr.svg?branch=master)](https://travis-ci.org/fvafrCU/excerptr)
[![Coverage Status](https://codecov.io/github/fvafrCU/excerptr/coverage.svg?branch=master)](https://codecov.io/github/fvafrCU/excerptr?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/excerptr)](https://cran.r-project.org/package=excerptr)

# excerptr
This is an R interface to [excerpts](https://pypi.python.org/pypi/excerpts).

## Introduction

Please read the [vignette.](http://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)

<!-- vignette. Either [the version on github](http://htmlpreview.github.io/?https://github.com/fvafrCU/excerptr/blob/master/inst/doc/excerptr_Introduction.html)
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
file [INSTALL](https://cran.r-project.org/package=rPython/INSTALL) there,
<!-- then install excerptr from [CRAN](https://cran.r-project.org/package=excerptr) -->
then install excerptr from [CRAN](https://cran.r-project.org/)

```r
install.packages("excerptr")
```

### Windows
Install [rPython-win](https://github.com/cjgb/rPython-win)
(follow the instructions at 
[https://cran.r-project.org/package=rPython/INSTALL](https://cran.r-project.org/package=rPython/INSTALL)
).
Then get the excerptr source
from [github](https://github.com/fvafrCU/excerptr), edit the file DESCRIPTION and remove the line reading
    OS_type: unix
and install the package manually:

```r
if (! require("git2r")) install.packages("git2r")
local_path <- file.path(tempdir(), "excerptr")
description <- file.path(local_path, "DESCRIPTION")
git2r::clone("https://github.com/fvafrCU/excerptr", local_path = local_path)
d <- readLines(description)
d1 <- d[-grep("^OS_type:", d)]
writeLines(d1, description)
install.packages(local_path, repos = NULL, type = "source")
```

