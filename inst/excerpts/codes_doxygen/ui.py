#!/usr/bin/env python3
# @file
# user interface functions
#

from . import main
from . import op


## @brief     Extract, Convert and Save Markdown Style Comments From a File
#
#    This is merely a wrapper to excerpt(), modify_path() and pandoc().
#
#
# @param		file_name	The file from which the lines are to be extracted.
# @param		pandoc_formats	The pandoc output formats to be used.
# @param		run_pandoc	Run pandoc on the markdown file created?
# @param		compile_latex	Compile the LaTeX file?
# @param		postfix	Set the output file postfix.
# @param		prefix	Set the output file prefix.
# @param		comment_character	The comment character of the files language.
# @param		output_path	Set a new file name or an output directory.
# @param		allow_pep8	Remove a leading single comment character and blank.
# @param		magic_character	The magic character marking lines as excerpts.
# @return
#        0 if output generation was successful.
#

def excerpts(file_name, comment_character="#", magic_character="%",
             output_path="", allow_pep8=True,
             prefix="", postfix="", run_pandoc=True,
             compile_latex=False, pandoc_formats="tex"):
    status = 1
    with open(file_name) as infile:
        lines = infile.readlines()
    lines = main.excerpt(lines=lines,
                         comment_character=comment_character,
                         magic_character=magic_character,
                         allow_pep8=allow_pep8)
    md_file_name = main.modify_path(file_name=file_name,
                                    output_path=output_path,
                                    postfix=postfix,
                                    prefix=prefix,
                                    extension="md")
    md_file = open(md_file_name, "w")
    md_file.writelines(lines)
    md_file.close()
    status = 0
    if run_pandoc:
        status = op.pandoc(file_name=md_file_name, compile_latex=compile_latex,
                           formats=pandoc_formats)
    return status
