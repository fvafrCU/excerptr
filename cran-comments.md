Dear CRAN team,
this is a resubmission of package excerptr 1.0.0, accounting for the failure to
build on win-builder and the creation of files in /tmp on unix.

I have set the OS_type in file DESCRITION to unix and replace any examples
writing to the system's tempdir with ones writing to the R processes tempdir.

Best, 
Dominik Cullmann

> I have packaged an R interface to my python package 'excerpts' which extracts 
> comments marked by some magic character and runs pandoc on the resulting files. 
> I use it (well, the python version) quite frequently to set a table of contents
> from a script file's structuring comments when I do not take the time to use
> knitr or sweave or use a language that doesn't care about reproducible research.
> 
> Hope it could be of use to others.
> Best,
> Dominik
> 
> # Package  excerptr 1.0.0 
> 
> ## Test  environments  
> - R Under development (unstable) (2017-04-20 r72572)
>   Platform: x86_64-pc-linux-gnu (64-bit)
>   Running under: Debian GNU/Linux 8 (jessie) 
> - R version 3.3.3 (2017-03-06)
>   Platform: x86_64-pc-linux-gnu (64-bit)
>   Running under: Ubuntu precise (12.04.5 LTS) 
> 
> ## R CMD check results
> 0 errors | 0 warnings | 1 note 
> checking CRAN incoming feasibility ... NOTE
> Maintainer: ‘Andreas Dominik Cullmann <adc-r@arcor.de>’
> 
> New submission
> 
> ## R CMD check results on Winbuilder
> Winbuilder "will not attempt to install this package on Windows". 
> Because this packages depends on rPython which is a unix only package. 
> If you install rPython-win following the instructions given by the rPython 
> package, excerptr should run on windows.
