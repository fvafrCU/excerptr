#' @include utils.R
#' @include internals.R
NULL

#' Set the Excerpts Path Option
#'
#' \pkg{excerptr} uses the option ("excerpts_path") to get the python code of
#' excerpts. This wrapper sets this option depending on whether you give a fixed
#' path, are developing the package or using the standard installation's code.
#'
#' @param path a fixed path. Equals \code{options(excerpts_path = path)}.
#' @param temporary Set a temporary path.
#' @return a character of length one containing the (new) path set.
#' @export
set_excertps_path <- function(path = NULL, temporary = FALSE) {
    if (is.null(path)) path <- construct_path(temporary = temporary)
    options(excerpts_path = path)
    return(invisible(path))
}

#' Get the Excerpts Path Option
#'
#' Get the option "excerpts_path", and set it, if unset.
#'
#' @param ... arguments passed to \code{\link{set_excertps_path}()}.
#' @seealso  \code{\link{set_excertps_path}}.
#' @return The status of the \pkg{rPython}\code{::\link[rPython]{python.call}}
#' call to excerpts.
#' @examples
#' options("excerpts_path" = NULL)
#' getOption("excertps_path")
#' excerptr:::get_excerpts_path() # internally calls set_excertps_path()
#' getOption("excertps_path")
get_excerpts_path <- function(...) {
    path <- getOption("excerpts_path")
    if (is.null(path)) {
        path <- set_excertps_path(...)
    }
    return(path)
}
