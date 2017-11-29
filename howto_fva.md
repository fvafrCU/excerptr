<!-- howto_fva.md is generated from howto_fva.Rmd. Please edit that file -->

# Install rPython-win
Install rPython-win following 
[these instructions](https://github.com/cjgb/rPython-win)
with the current (May 2017) python setup at fvafr. 
Assuming you have installed R and Rtools from the software shop, you can run:


```
local_directory <- tempdir()
local_path <- file.path(local_directory, "master.zip")
url <- "https://github.com/cjgb/rPython-win/archive/master.zip"
download.file(url, local_path, method = "wininet", mode = "wb")
unzip(local_path, exdir = local_directory)
asdf
rpython_path <- file.path(local_directory, "rPython-win-master")
configure <- file.path(rpython_path, "configure.win")
conf <- readLines(configure)
conf <- sub("([Pp]ython)27/", "\\134_x64/", conf)
conf <- sub("([Pp]ython)27", "\\134", conf)
conf <- sub("(/[Pp]ython34)", "/python\\1", conf)
writeLines(conf, configure)
if (! require("RJSONIO")) install.packages("RJSONIO")
if (! require("devtools")) install.packages("devtools")
devtools::install(rpython_path)
```
To date you need to use R 3.2.5 for this to work since our Rtools version is out
of date and does not work for our current R installation. 
Run "C:\Program Files\R\R-3.2.5\bin\x64\Rgui.exe" from a command prompt, set the 
R version used by RStudio to 3.2.5 or 
navigate to "C:\Program Files\R\R-3.2.5\bin\x64" and start Rgui.exe.

