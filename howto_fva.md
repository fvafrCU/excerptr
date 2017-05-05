<!-- howto_fva.md is generated from howto_fva.Rmd. Please edit that file -->

# Install rPython-win
Install rPython-win following 
[these instructions](https://github.com/cjgb/rPython-win)
with the current (May 2017) python setup at fvafr:


```
local_directory <- tempdir()
local_path <- file.path(local_directory, "master.zip")
url <- "https://github.com/cjgb/rPython-win/archive/master.zip"
download.file(url, local_path, method = "wininet", mode = "wb")
unzip(local_path, exdir = local_directory)
rpython_path <- file.path(local_directory, "rPython-win-master")
configure <- file.path(rpython_path, "configure.win")
conf <- readLines(configure)
conf <- sub("([Pp]ython)27/", "\\134_x64/", conf)
conf <- sub("([Pp]ython)27", "\\134", conf)
conf <- sub("(/[Pp]ython34)", "/python\\1", conf)
writeLines(conf, configure)
install.packages(rpython_path, repos = NULL, type = "source")
```

# Install excerptr

Get the excerptr source from 
[github](https://github.com/fvafrCU/excerptr), 
edit the file DESCRIPTION by removing the line reading
    OS_type: unix
and inserting your R version and install the package manually:

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
install.packages(excerptr_path, repos = NULL, type = "source")
```

# Run excerptr and pandoc on a Windows machine at fvafr

excerptr calls to pandoc fail at fvafr. And since it's a windows installation 
there's probably not [pdf]latex at hand. 
But we can call pandoc from within R to produce html:

```
input_file <- system.file(package = "excerptr", "excerpts", "tests", "files", 
                          "some_file.txt")
output_path <- tempdir()

name <-  strsplit(basename(input_file), split = "\\.")[[1]][1]
excerptr::excerptr(file_name = input_file,
                   output_path = output_path, run_pandoc = FALSE)
html_file <- file.path(output_path, paste0(name, ".html"))
system2(command = basename(Sys.which("pandoc")), 
        args = c(file.path(output_path, paste0(name, ".md")), "-o", 
                 html_file))                     
if (interactive()) browseURL(html_file)
```


