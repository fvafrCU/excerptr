#' @include options.R
NULL

#' Excerpt Structuring Comments and Set a Table of Contents.
#'
#' Just a wrapper to the python function excerpts.excerpts.
#' See \url{https://github.com/fvafrCU/excerpts/} for details.
#'
#' @param file_name Name the file from which to excerpt.
#' @param comment_character Should be "#" for R.
#' @param magic_character The magic character marking the structuring comments
#' in \code{file_name}.
#' @param output_path Name the path where to output to.
#' @param allow_pep8 Don't bother. See excerpts.excerpts for details.
#' @param prefix Give a prefix to use for output files.
#' @param postfix Give a postfix to use for output files.
#' @param run_pandoc Try to run \command{pandoc} on the output?
#' @param compile_latex Try to compile LaTeX if \command{pandoc} has output
#' LaTeX?
#' @param pandoc_formats A character vector naming the output formats for
#' \command{pandoc}.
#' @return The status of the \pkg{rPython}\code{::\link[rPython]{python.call}}
#' call to excerpts.
#' @export
#' @examples
#' root <- system.file(package = "excerptr")
#' test_files <- file.path(root, "excerpts", "tests", "files")
#' excerptr(file_name = file.path(test_files, "some_file.txt"),
#'          output_path = tempdir(), run_pandoc = FALSE,
#'          compile_latex = FALSE,
#'          pandoc_formats = c("tex", "html"))
excerptr <- function(file_name, comment_character = "#", magic_character = "%",
             output_path = "", allow_pep8 = TRUE,
             prefix = "", postfix = "", run_pandoc = TRUE,
             compile_latex = FALSE, pandoc_formats = "tex") {
    load_excerpts()
    st <- NA
    tryCatch(st <- rPython::python.call("excerpts", file_name = file_name,
                                        comment_character = comment_character,
                                        magic_character = magic_character,
                                        output_path = output_path,
                                        allow_pep8 = allow_pep8,
                                        prefix = prefix, postfix = postfix,
                                        run_pandoc = run_pandoc,
                                        compile_latex = compile_latex,
                                        pandoc_formats =
                                            as.list(pandoc_formats)),
             error = function(e) return(e))
    # Usually, the above should do. But I had unreproducible errors reported.
    # Maybe due to stale python installations. However, in these cases
    # excerpts worked, but the pandoc call via python.call failed. So I try to
    # handle exceptions:
    if (is.na(st)) {
        is_pandoc_installed <- nchar(Sys.which("pandoc")) > 0 &&
            nchar(Sys.which("pandoc-citeproc")) > 0
        if (is_pandoc_installed) {
            reference <- "1.12.3"
            version <- strsplit(system2(Sys.which("pandoc"), "--version",
                                        stdout = TRUE), split = " ")[[1]][2]
            is_uptodate <- utils::compareVersion(version, reference) >= 0
            if (is_uptodate) {
                if (isTRUE(compile_latex)) warning("Skipping LaTeX compilation")
                st <- excerptr(file_name = file_name,
                               comment_character = comment_character,
                               magic_character = magic_character,
                               output_path = output_path,
                               allow_pep8 = allow_pep8,
                               prefix = prefix, postfix = postfix,
                               run_pandoc = FALSE,
                               compile_latex = FALSE,
                               pandoc_formats = as.list(pandoc_formats))
                md_file <- file.path(output_path, sub("\\.[rRsS]$", ".md",
                                                      basename(file_name)))
                out_file <- sub("\\.md$", paste0(".", format), md_file)
                system2(command = basename(Sys.which("pandoc")),
                        args = c(md_file, "-o",
                                 out_file))
                if (! file.exists(out_file)) {
                    stop("Could not compile ", file_name, ".")
                } else {
                    message("Output file is", out_file, ".")
                }

            } else {
                stop("pandoc version ", version,
                     " is less than required version ", reference, ".")
            }
        } else {
            stop("Can not find a pandoc installation.")
        }
    }
    return(st)
}
