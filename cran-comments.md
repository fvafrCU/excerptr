Dear CRAN Team,
this is a resubmission of package 'excerptr'. I have added the following changes:

* Handle exception from pandoc call via rPython using an R system call to pandoc.
  Calling pandoc from rPython fails on windows, so we work around using
  system2().

Please upload to CRAN.
Best, Dominik

# Package excerptr 1.4.0
## Test  environments 
- R Under development (unstable) (2017-11-07 r73685)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Devuan GNU/Linux 1 (jessie)
- R version 3.4.2 (2017-01-27)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Ubuntu 14.04.5 LTS
- win-builder (devel)

## R CMD check results
0 errors | 0 warnings | 0 notes
