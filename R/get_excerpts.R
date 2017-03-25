get_excerpts <- function(force = FALSE) {
    root <- rprojroot::is_r_package
    python_code <- file.path(root$find_file(), "inst", "excerpts")
    if (isTRUE(force)) unlink(python_code, recursive = TRUE)
    status <- git2r::clone("https://github.com/fvafrCU/excerpts/", 
                           python_code)
    return(status)
}
