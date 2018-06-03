# excerptr 1.4.1

* Declared imports from devtools in tests as requested by CRAN on Thu, 17 May 2018 10:28:07 +0200.

# excerptr 1.4.0

* Handle exception from pandoc call via rPython using an R system call to pandoc.
  Calling pandoc from rPython fails on windows, so we work around using
  system2().

# excerptr 1.3.1

* Run tests requiring pandoc only if pandoc is installed.

# excerptr 1.3.0

* Add 'excerpts' version 2.0.0 from github and adjust the internal interface in
  excerptr().
* Enhance documentation

# excerptr 1.2.0

* Add 'excerpts' version 1.1.0 from github.
* vignettes/excerptr_Introduction.Rmd: cope with CRAN's check warnings.

# excerptr 1.1.0

* vignettes/excerptr_Introduction.Rmd: cope with CRAN's check warnings.
* R/internals.R: construct path using inst/ only on developement.

# excerptr 1.0.2

* Change example to not require pandoc.

# excerptr 1.0.1

* Remove test failing on CRAN.

# excerptr 1.0.0

* First release, just importing [excerpts](https://github.com/fvafrCU/excerpts).
