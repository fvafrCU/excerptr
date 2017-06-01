#' @include get_excerpts.R
NULL

#' Concatenate Code Files into one File
#'
#' Concatenate python codes and remove local imports and imports from
#' __future__.
#'
#' @param codes a character vector of file names.
#' @return The concatenated code.
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
    # get rid of imports from __future__ as excertps uses them only to soothe
    # pylint:
    future_index <- grep("from __future__ import ", code)
    code <- code[- future_index]
    return(code)
}

#' Load Excerpts
#'
#' Load excerpts' python codes.
#'
#' @return The status of \pkg{rPython}\code{::\link[rPython]{python.exec}}.
load_excerpts <- function() {
    python_directory <- get_excerpts_path()
    python_codes <- file.path(python_directory, "excerpts")
    codes <- list.files(python_codes, pattern = "^[^_].*\\.py",
                        full.names = TRUE)
    if (length(codes) == 0) {
        # devtools::test() creates it's own testing environment
        get_excerpts(directory = python_directory)
        codes <- list.files(python_codes, pattern = "^[^_].*\\.py",
                            full.names = TRUE)
    }
    # we don't need command_line.py and it imports excerpts. This is not
    # intended, especially as on systems where excerpts is not installed
    # (travis, for example) this will cause an error.
    codes <- codes[! grepl("command_line.py", codes)]
    code <- concatenate_python_codes(codes)
    status <- rPython::python.exec(code)
    return(status)
}
