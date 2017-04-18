# inspired by https://raw.githubusercontent.com/yihui/knitr/master/Makefile
PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGSRC  := $(shell basename `pwd`)

temp_file := $(shell tempfile)
lintr_script := utils/lintr.R
LOG_DIR := log

R := R-devel
Rscript := Rscript-devel

all: install_bare dev_check dev_test dev_vignettes crancheck utils README.md

# devtools
dev_all: dev_test dev dev_vignettes


dev: dev_check dev_spell

dev_spell: roxy 
	${Rscript} --vanilla -e 'spell <- devtools::spell_check(ignore = c("github" , "https", "lintr", "pylint", "Kernighan", "jimhester", "Cullmann", "adc", "arcor", "de", "tryCatch")); if (length(spell) > 0) {print(spell); stop("spell check failed")} '

dev_test:
	rm ${temp_file} || TRUE; \
	${Rscript} --vanilla -e 'devtools::test()' >  ${temp_file} 2>&1; \
	sed -n -e '/^DONE.*/q;p' < ${temp_file} | \
	sed -e "s# /.*\(${PKGNAME}\)# \1#" > ${LOG_DIR}/dev_test.Rout 

dev_check: dev_test 
	rm ${temp_file} || TRUE; \
	${Rscript} --vanilla -e 'devtools::check(cran = TRUE, check_version = TRUE, args = "--no-tests")' > ${temp_file} 2>&1; \
	grep -v ".*'/" ${temp_file} | grep -v ".*‘/" > ${LOG_DIR}/dev_check.Rout ;\
	grep "checking tests ... SKIPPED" ${LOG_DIR}/dev_check.Rout

dev_vignettes:
	${Rscript} --vanilla -e 'devtools::build_vignettes()'

dev_release:
	${Rscript} --vanilla -e 'devtools::release()'

dev_devel:
	${Rscript} --vanilla -e 'devtools::use_dev_version()'

# R CMD 
craninstall: crancheck
	${R} --vanilla CMD INSTALL  ${PKGNAME}_${PKGVERS}.tar.gz

crancheck: build  
	export _R_CHECK_FORCE_SUGGESTS_=TRUE && \
        ${R} --vanilla CMD check --as-cran ${PKGNAME}_${PKGVERS}.tar.gz 

install: check 
	${R} --vanilla CMD INSTALL  ${PKGNAME}_${PKGVERS}.tar.gz && \
        printf '===== have you run\n\tmake demo && ' && \
        printf 'make utils\n?!\n' 

install_bare: build_bare 
	${R} --vanilla CMD INSTALL  ${PKGNAME}_${PKGVERS}.tar.gz 

check_bare: build_bare 
	export _R_CHECK_FORCE_SUGGESTS_=TRUE && \
		_R_CHECK_CRAN_INCOMING_USE_ASPELL_=TRUE && \
        ${R} --vanilla CMD check --no-examples ${PKGNAME}_${PKGVERS}.tar.gz && \
        printf '===== run\n\tmake install\n!!\n'

check: build 
	export _R_CHECK_FORCE_SUGGESTS_=TRUE && \
        ${R} --vanilla CMD check ${PKGNAME}_${PKGVERS}.tar.gz && \
        printf '===== run\n\tmake install\n!!\n'

build_bare: 
	${R} --vanilla CMD build ../${PKGSRC}

build: roxy 
	${R} --vanilla CMD build ../${PKGSRC}

direct_check:  
	${R} --vanilla CMD check ../${PKGSRC} ## check without build -- not recommended


.PHONY: roxy
roxy:
	${R} --vanilla -e 'roxygen2::roxygenize(".")'

# utils
.PHONY: utils
utils: cleanr lintr coverage

.PHONY: coverage
coverage:
	${Rscript} --vanilla -e 'co <- covr::package_coverage(path = ".", function_exclusions = "\\.onLoad"); covr::zero_coverage(co); print(co)' > ${LOG_DIR}/covr.Rout 2>&1 


.PHONY: cleanr
cleanr:
	${Rscript} --vanilla -e 'cleanr::check_directory("R/", max_num_arguments = 10, check_return = FALSE)'

.PHONY: lintr
lintr:
	rm inst/doc/*.R || true
	${Rscript} --vanilla ${lintr_script} > ${LOG_DIR}/lintr.Rout 2>&1 

.PHONY: clean
clean:
	rm -rf ${PKGNAME}.Rcheck

.PHONY: remove
remove:
	 ${R} --vanilla CMD REMOVE  ${PKGNAME}

# specifics
## cran-comments.md: dev_check.Rout
## 	${Rscript} --vanilla -e 'source("./utils/cran_comments.R"); provide_cran_comments()' > cran_comments.Rout 2>&1 

README.md: README.Rmd
	${Rscript} --vanilla -e 'knitr::knit("README.Rmd")'

##% git tag
.PHONY: tag
make tag: setup.py
	./utils/tag.cl

.PHONY: dependencies
dependencies:
	${Rscript} --vanilla -e 'deps <-c("rprojroot", "covr", "knitr", "devtools", "rmarkdown", "RUnit", "checkmate", "roxygen2", "lintr", "hunspell"); for (dep in deps) {if (! require(dep, character.only = TRUE)) install.packages(dep, repos = "https://cran.uni-muenster.de/")}'

