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
You probably want to have [pandoc](https://www.pandoc.org/) and a TeX-System such as 
[TeXLive](https://www.tug.org/texlive/) installed.

## Installation

### Unix
Install [the rPython package](https://cran.r-project.org/package=rPython), see 
file [INSTALL](https://cran.r-project.org/package=rPython/INSTALL) there,
then install excerptr from [CRAN](https://cran.r-project.org/package=excerptr)

```r
install.packages("excerptr")
```

### Windows

#### rPython-win
Install [rPython-win](https://github.com/cjgb/rPython-win)
(following the instructions at 
[https://cran.r-project.org/package=rPython/INSTALL](https://cran.r-project.org/package=rPython/INSTALL)
).

##### rPython-win for Folks at [fvafr](http://www.fva-bw.de/)
Should you happen to be one of my colleagues at  [fvafr](http://www.fva-bw.de/), please follow 
[these instructions](https://github.com/fvafrCU/excerptr/blob/master/howto_fva.md).

#### excerptr
Then get the excerptr source
from [github](https://github.com/fvafrCU/excerptr), edit the file DESCRIPTION and remove the line reading
    OS_type: unix
and install the package manually:

```
local_directory <- tempdir()
local_path <- file.path(local_directory, "master.zip")
url <- "https://github.com/fvafrCU/excerptr/archive/master.zip"
download.file(url, local_path, method = "wininet", mode = "wb")
unzip(local_path, exdir = local_directory)
excerptr_path <- file.path(local_directory, "excerptr-master")
description <- file.path(excerptr_path, "DESCRIPTION")
my_r_version <- paste(R.Version()[["major"]], R.Version()[["minor"]], sep = ".")
d <- readLines(description)
d1 <- d[-grep("^OS_type:", d)]
d1[grep("^ *R \\(", d1)] <- paste0("    R (>= ", my_r_version,")")
writeLines(d1, description)
if (! require("rprojroot")) install.packages("rprojroot")
install.packages(excerptr_path, repos = NULL, type = "source")
```


