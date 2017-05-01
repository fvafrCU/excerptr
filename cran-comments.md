Dear CARN Team,
this is a resubmission of package excerptr dealing with the errors reported for
version 1.0.1 on solaris and osx. I have change the example to not require
pandoc (though using the package without pandoc is a bit pointless). 

I have change the vignette to not require pandoc as well. I hope this will take
care of the warning I get on solaris and osx.
Runnig R-devel --vanilla CMD check --as-cran --no-build-vignettes excerptr_1.0.2.tar.gz
on x86_64-pc-linux-gnu (64-bit) with pandoc deinstalled I get two NOTEs (the
first on the days since last update, the second on NEWS.md and README.md not
being checked without pandoc installed) but no more warnings.
Best, 
Dominik Cullmann

# Package  excerptr 1.0.2 

## Test  environments  
- R Under development (unstable) (2017-04-29 r72639)
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


