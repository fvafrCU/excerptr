python_dir <- "excerpts"
codes <- list.files(python_dir, pattern = "^[^_].*\\.py", full.names = TRUE)
code <- NULL
for (code_file in codes) {
    code <- c(code, readLines(code_file))
}
local_import_index <- grep("from \\. import", code)
local_imports <- trimws(unique(sapply(strsplit(code[local_import_index], 
                                               split = "import"), "[[", 2)))
code <- code[- local_import_index]
for (local_import in local_imports) {
    code <- gsub(paste0(local_import, "\\."), "", code)
}
future_index <- grep("from __future__ import ", code)
code <- c(code[future_index], code[- future_index])
cat(code, file = "foo.py", sep = "\n")
