#' Construct a (temporary) Path Where to Look for the Inst Files
#'
#' @param temporary Use \code{\link{tempdir}()} as root for path construction?
#' @return A character of length one naming the path constructed.
construct_path <- function(temporary = FALSE) {
    base <- c("inst", "excerpts")
    if (isTRUE(temporary)) {
        root <- tempdir()
    } else {
        root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                         error = function(e) return(FALSE)
                         )
        if (root == FALSE) {
            root <- base::system.file(package = "excerptr")
        }
        if (root == "") {
            warning("Don't know where you are, using a temporary directory.")
            root <- tempdir()
        }
    }
    path <- file.path(root, paste(base, collapse = .Platform$file.sep))
    return(path)
}
