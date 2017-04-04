construct_path <- function(temporary = FALSE) {
    base <- c("inst", "excerpts")
    if (isTRUE(temporary)) {
        root <- tempdir()
    } else {
        root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                         error = function(e) return(FALSE)
                         )
        if (root == FALSE) {
            root <- base::system.file(base, package = "excerptr")
        }
    }
    path <- file.path(root, paste(base, collapse = .Platform$file.sep))
    return(path)
}
set_path <- function(path = NULL, temporary = FALSE) {
    if (is.null(path)) path <- construct_path(temporary = temporary)
    options(excerpts_path = path)
    return(invisible(NULL))
}
get_path <- function() {
    path <- getOption("excerpts_path")
    if (is.null(path)) {
        path <- construct_path()
    }
    return(path)
}
get_excerpts <- function(force = FALSE, remove_dot_git = TRUE) {
    python_code <- get_path()
    if (isTRUE(force)) unlink(python_code, recursive = TRUE)
    status <- git2r::clone("https://github.com/fvafrCU/excerpts/",
                           python_code)
    if (remove_dot_git) {
        status <- utils::capture.output(status)
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
load_excerpts <- function() {
    python_directory <- get_path()
    python_codes <- file.path(python_directory, "excerpts")
    codes <- list.files(python_codes, pattern = "^[^_].*\\.py",
                        full.names = TRUE)
    print(codes)
    print(length(codes))
    if (length(codes) == 0) {
        # devtools::test() creates it's own testing environment
        set_path(path = dirname(tempdir()))
        get_excerpts()
        set_path(path = file.path(dirname(tempdir()), "inst", "excerpts"))
    }
    code <- concatenate_python_codes(codes)
    status <- rPython::python.exec(code)
    return(status)
}
