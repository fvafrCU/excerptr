Dear CARN Team,
this is a resubmission of package excerptr dealing with the errors reported for
version 1.0.1 on solaris and osx. I have change the example to not require
pandoc (though using the package without pandoc is a bit pointless). 

I have not dealt with the warnings. They originate from pandoc being not
available on osx and solaris, but the package is meant to be used with pandoc.
So I stated in the SystemRequirements field of file DESCRIPTION that the 
vignette requires pandoc.

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


