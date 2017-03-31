get_excerpts <- function(force = FALSE, remove_dot_git = TRUE) {
    root <- rprojroot::is_r_package
    python_code <- file.path(root$find_file(), "inst", "excerpts")
    if (isTRUE(force)) unlink(python_code, recursive = TRUE)
    status <- git2r::clone("https://github.com/fvafrCU/excerpts/", 
                           python_code)
    if (remove_dot_git) {
        status <- capture.output(status)
        unlink(file.path(python_code, ".git/"), recursive = TRUE, force = TRUE)
    }
    return(status)
}
