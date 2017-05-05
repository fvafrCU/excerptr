local_directory <- tempdir()
local_path <- file.path(local_directory, "master.zip")
url <- "https://github.com/cjgb/rPython-win/archive/master.zip"
download.file(url, local_path, method = "wininet", mode = "wb")
unzip(local_path, exdir = local_directory)
rpython_path <- file.path(local_directory, "rPython-win-master")
configure <- file.path(rpython_path, "configure.win")
conf <- readLines(configure)
conf <- gsub("27", "34", conf)
conf <- sub("(/[Pp]ython34)", "/python\\1", conf)
writeLines(conf, configure)
install.packages(rpython_path, repos = NULL, type = "source")

