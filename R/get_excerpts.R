#' Clone the Excerpts Code from Github
#'
#' @param directory Where to clone to.
#' @param force Overwrite the directory?
#' @param remove_dot_git Remove the .git/ from the clone?
#' @return The status of \code{git2r::clone}, or, if remove_dot_git is
#' TRUE, the \code{\link{capture.output}} thereof.
#' @export
#' @examples
#' path <- file.path(tempdir(), "excerpts")
#' get_excerpts(directory = path, force = TRUE)
#' \dontrun{print(set_excertps_path(path = path))}
get_excerpts <- function(directory = get_excerpts_path(),
                         force = FALSE, remove_dot_git = TRUE) {
    if (isTRUE(force)) unlink(directory, recursive = TRUE)
    status <- git2r::clone(url = "https://github.com/fvafrCU/excerpts/",
                           local_path = directory)
    if (remove_dot_git) {
        status <- utils::capture.output(status)
        unlink(file.path(directory, ".git/"), recursive = TRUE, force = TRUE)
    }
    return(status)
}
