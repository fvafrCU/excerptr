Dear CRAN Team,
this is a resubmission of package excerptr dealing with some of the check
results from https://cran.r-project.org/web/checks/check_results_excerptr.html:
> Dear maintainer,
> 
> Pls see
> <https://cran.r-project.org/web/checks/check_results_excerptr.html>:
> 
> Your test code incorrectly assumes that the package used for checking is
> always the found on the library path, which clearly is not the case:
> please fix as necessary, presumably by removing this test.
> 
> -k

Following Kurt Hornik's advice, I have removed a test.
I have also adjusted another test to not require pandoc installed, as it failed
hoping to catch most of the other errors.
There is one error on  r-release-osx-x86_64, r-oldrel-osx-x86_64 that I do not
understand. Maybe python3 or the rPython package are missing.

I did not fix the warnings, though, they refer to an outdated version of pandoc 
being used building the vignettes.

Best, 
Dominik Cullmann

# Package  excerptr 1.0.1 

## Test  environments  
- R Under development (unstable) (2017-04-25 r72618)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Debian GNU/Linux 8 (jessie) 
- R version 3.4.0 (2017-04-21)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Ubuntu precise (12.04.5 LTS) 
- win-builder (devel) 

## R CMD check results
0 errors | 0 warnings | 1 note 
checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Andreas Dominik Cullmann <adc-r@arcor.de>’

Days since last update: 3


