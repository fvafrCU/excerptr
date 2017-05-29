#' Construct a (temporary) Path Where to Look for the Inst Files
#'
#' Construct a (temporary) path where to look for the files installed with the
#' package.
#' @details We need to load python codes that are located under the root with
#' the installation and under 'inst/' while developing.
#'
#' @param temporary Use \code{\link{tempdir}()} as root for path construction?
#' @return A character of length one naming the path constructed.
construct_path <- function(temporary = FALSE) {
    base <- c("excerpts")
    if (isTRUE(temporary)) {
        root <- tempdir()
    } else {
        root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                         error = function(e) return(FALSE)
                         )
        if (root == FALSE) {
            root <- base::system.file(package = "excerptr")
        } else {
            base <- c("inst", base)
        }

        if (root == "") {
            warning("Don't know where you are, using a temporary directory.")
            root <- tempdir()
        }
    }
    path <- file.path(root, paste(base, collapse = .Platform$file.sep))
    return(path)
}
