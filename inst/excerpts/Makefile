#% define variables
##% user set variables
modul := excerpts
postfix := _o
TEST_FILE := tests/files/some_file.txt
##% derived variables
CLI := ~/.local/bin/${modul}
SOURCE := $(shell find ${modul} -type f -name "*.py")
VERSION := $(shell grep version ./setup.py | cut -f2 -d"'")


#% make targets
all: install doc analyse package run test tests  tag

##% installation
install: README.rst
	 pip3 install . --upgrade --user

##% cli
cli: install
	${CLI} ${TEST_FILE} -o _cli -O output \
		-p --formats html

##% pypi
.PHONY: upload_pypi
upload_pypi: package
	twine upload dist/*${VERSION}* 


##% testpypi
.PHONY: testpypi
testpypi: package
	#python3 setup.py register -r https://testpypi.python.org/pypi
	twine upload dist/*${VERSION}* -r testpypi

##% packaging
package: dist build README.rst 

dist: ${SOURCE} ./setup.py
	python3 ./setup.py sdist

build: ${SOURCE} ./setup.py
	python3 setup.py bdist_wheel

##% testing
test: log/unittest.log log/coverage.log 
log/unittest.log: tests/test_basic.py ${SOURCE}
	python3 ./tests/test_basic.py > log/unittest.log 2>&1
log/coverage.log: tests/test_basic.py ${SOURCE}
	python3-coverage run tests/test_basic.py
	python3-coverage report -m > log/coverage.log
	python3-coverage html

tests: tests/files/glm.md tests/files/phy.md ${SOURCE}
tests/files/glm.md: tests/files/glm.R
	${CLI} -c '#' -m '%' tests/files/glm.R

tests/files/phy.md: tests/files/phy.c
	${CLI} -c '///' -m '%' tests/files/phy.c
##%  analyse code
analyse: log/pep8.log log/pylint.log log/cleanr.log

log/pep8.log: ${SOURCE}
	pep8 ./${modul}/ > ./log/pep8.log || true

log/pylint.log: ${SOURCE}
	pylint ./${modul}/ > ./log/pylint.log || true

log/cleanr.log: ${SOURCE}
	Rscript --vanilla -e 'codes <- list.files("excerpts", pattern = ".*\\.py", full.names = TRUE); for (code in codes) print(cleanr:::check_file_layout(code)) '> log/cleanr.log 2>&1


##% create documentation
doc: ./docs/${modul}.html ./docs/doxygen doxygenize 

docs/${modul}.html: ${SOURCE}
	./utils/pydoc.cl


docs/doxygen: ${SOURCE} .doxygen.conf
	rm -rf docs/doxygen || true
	mkdir docs/ || true
	doxygen .doxygen.conf | sed -e "s#/home/.*\(${modul}\)#./\1#" \
		> ./log/doxygen.log 2>&1 
	! grep "warning:" ./log/doxygen.log 

##% README
README.rst: README.rstw tests/files/some_file.txt
	pweave README.rstw 
tmp_README.html: README.rst
	pandoc README.rst -o tmp_README.html

# I want to keep a doxypypy'ed version of my codes
.PHONY: doxygenize
doxygenize: ${SOURCE}
	./utils/doxygenize.cl 

##% maintenance
requirements:
	pip3 install --user -r requirements.txt

##% git tag
.PHONY: tag
make tag: setup.py
	./utils/tag.cl

##% old utils
run: install
	python3 ./utils/run.py
tests/files/some_code.py: tests/files/some_file.txt
	./utils/python_file.cl
