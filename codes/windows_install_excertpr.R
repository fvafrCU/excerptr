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

