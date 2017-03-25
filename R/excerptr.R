concatenate_python_codes <- function(codes) {
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
    # get rid of imports from __future__ as I use them only to soothe pylint:
    future_index <- grep("from __future__ import ", code)
    code <- code[- future_index]
    return(code)
}
#' root <- system.file(package = "excerptr")
#' test_files <- file.path(root, "inst", "excerpts", "tests", "files")
#' 
#' excerptr(file_name = file.path(test_files, "some_file.txt"),
#'          output_path = dirname(tempdir()), run_pandoc = TRUE, 
#'          pandoc_formats = c("pdf"))
excerptr <- function(file_name, comment_character = "#", magic_character = "%",
             output_path = "", allow_pep8 = TRUE,
             prefix = "", postfix = "", run_pandoc = TRUE,
             compile_latex = FALSE, pandoc_formats = "tex") {
    root <- system.file(package = "excerptr")
    if (nchar(root) == 0)
        root <- rprojroot::find_root(criterion = rprojroot::is_r_package)
    python_code <- file.path(root, "inst", "excerpts")
    python_dir <- file.path(python_code, "excerpts")
    codes <- list.files(python_dir, pattern = "^[^_].*\\.py", full.names = TRUE)
    code <- concatenate_python_codes(codes)
    rPython::python.exec(code)
    status <- rPython::python.call("excerpts", file_name = file_name, 
                                   comment_character = comment_character, 
                                   magic_character = magic_character,
                                   output_path = output_path, 
                                   allow_pep8 = allow_pep8,
                                   prefix = prefix, postfix = postfix, 
                                   run_pandoc = run_pandoc, 
                                   compile_latex = compile_latex,
                                   pandoc_formats = pandoc_formats)
    return(status)
}
