excerpts_path <- function(temporary = FALSE) {
    base <- c("inst", "excerpts")
    root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package), 
                     error = function(e) return(FALSE)
                     )
    if (root == FALSE) {
        excerptr_excerpts <- system.file(base, package = "excerptr")
        if (excerptr_excerpts == "" || isTRUE(temporary)) {
            root <- tempdir()
        } else {
            root <- excerptr_excerpts
        }
    }
    excerpts_path <- file.path(root, paste(base, collapse = .Platform$file.sep))
    return(excerpts_path)
}
set_excerpts_path <- function(...) {
    options(excerpts_path = excerpts_path(...))
    return(invisible(NULL))
}
get_excerpts_path <- function() {
    path <- getOption("excerpts_path")
    if (is.null(path)) {
        excerpts_path <- excerpts_path()
    } else {
        excerpts_path  <- path
    }

}
get_excerpts <- function(force = FALSE, remove_dot_git = TRUE) {
    python_code <- get_excerpts_path()
    if (isTRUE(force)) unlink(python_code, recursive = TRUE)
    status <- git2r::clone("https://github.com/fvafrCU/excerpts/", 
                           python_code)
    if (remove_dot_git) {
        status <- capture.output(status)
        unlink(file.path(python_code, ".git/"), recursive = TRUE, force = TRUE)
    }
    return(status)
}
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
load_excerpts <- function(...) {
    python_directory <- get_excerpts_path(...)
    python_codes <- file.path(python_directory, "excerpts")
    codes <- list.files(python_codes, pattern = "^[^_].*\\.py", full.names = TRUE)
    code <- concatenate_python_codes(codes)
    status <- rPython::python.exec(code)
    return(status)
}
