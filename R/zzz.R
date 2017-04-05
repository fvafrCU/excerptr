.onLoad <- function(libname, pkgname) {
    if (is.character(libname) && is.character(pkgname)) {
       # soothe codetools::checkUsagePackage
    }
    set_excertps_path()
    return(invisible(NULL))
}
