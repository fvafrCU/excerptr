Dear CRAN team,
I have packaged an R interface to my python package 'excerpts' which extracts 
comments marked by some magic character and runs pandoc on the resulting files. 
I use it (well, the python version) quite frequently to set a table of contents
from a script file's structuring comments when I do not take the time to use
knitr or sweave or use a language that doesn't care about reproducible research.

Hope it could be of use to others.
Best,
Dominik

# Package  excerptr 1.0.0 

## Test  environments  
- R Under development (unstable) (2017-04-20 r72572)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Debian GNU/Linux 8 (jessie) 
- R version 3.3.3 (2017-03-06)
  Platform: x86_64-pc-linux-gnu (64-bit)
  Running under: Ubuntu precise (12.04.5 LTS) 
- win-builder (devel) 

## R CMD check results
0 errors | 0 warnings | 1 note 
checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Andreas Dominik Cullmann <adc-r@arcor.de>’

New submission


