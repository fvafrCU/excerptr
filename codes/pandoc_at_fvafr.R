input_file <- system.file(package = "excerptr", "excerpts", "tests", "files",
                          "some_file.txt")
output_path <- tempdir()
excerptr::excerptr(file_name = input_file, output_path = output_path,
                   run_pandoc = TRUE, pandoc_formats = "html")
html_file <- file.path(output_path,
                       paste0(strsplit(basename(input_file),
                                       split = "\\.")[[1]][1], ".html"))
if (interactive()) browseURL(html_file)
