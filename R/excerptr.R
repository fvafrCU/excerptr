#' root <- system.file(package = "excerptr")
#' test_files <- file.path(root, "inst", "excerpts", "tests", "files")
#' 
#' excerptr(file_name = file.path(test_files, "some_file.txt"),
#'          output_path = dirname(tempdir()), run_pandoc = TRUE, 
#'          pandoc_formats = c("pdf"))
excerptr <- function(file_name, comment_character = "#", magic_character = "%",
             output_path = "", allow_pep8 = TRUE,
             prefix = "", postfix = "", run_pandoc = TRUE,
             compile_latex = FALSE, pandoc_formats = "tex") {
    load_excerpts()
    status <- rPython::python.call("excerpts", file_name = file_name, 
                                   comment_character = comment_character, 
                                   magic_character = magic_character,
                                   output_path = output_path, 
                                   allow_pep8 = allow_pep8,
                                   prefix = prefix, postfix = postfix, 
                                   run_pandoc = run_pandoc, 
                                   compile_latex = compile_latex,
                                   pandoc_formats = pandoc_formats)
    return(status)
}
