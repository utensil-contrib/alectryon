# -*- makefile -*-
### Auto-generated with etc/regen_makefile.py ###
### Do not edit! ###

_output/tests/:
	mkdir -p $@

tests_targets :=

# Coq → HTML
_output/tests/corner_cases.html: tests/corner_cases.rst
	$(alectryon) --stdin-filename $< --frontend rst -o $@ - < $<
tests_targets += _output/tests/corner_cases.html
# Coq → LaTeX
_output/tests/corner_cases.xe.tex: tests/corner_cases.rst
	$(alectryon) $< -o $@ --latex-dialect xelatex
tests_targets += _output/tests/corner_cases.xe.tex

# HTML4
_output/tests/dialects.4.html: tests/dialects.rst
	$(alectryon) --html-dialect=html4 -o $@ $<
tests_targets += _output/tests/dialects.4.html
# HTML5
_output/tests/dialects.5.html: tests/dialects.rst
	$(alectryon) --html-dialect=html5 -o $@ $<
tests_targets += _output/tests/dialects.5.html
# LaTeX
_output/tests/dialects.tex: tests/dialects.rst
	$(alectryon) --latex-dialect=pdflatex -o $@ $<
tests_targets += _output/tests/dialects.tex
# XeLaTeX
_output/tests/dialects.xe.tex: tests/dialects.rst
	$(alectryon) --latex-dialect=xelatex -o $@ $<
tests_targets += _output/tests/dialects.xe.tex
# LuaLaTeX
_output/tests/dialects.lua.tex: tests/dialects.rst
	$(alectryon) --latex-dialect=lualatex -o $@ $<
tests_targets += _output/tests/dialects.lua.tex

# reST → Coq
_output/tests/directive-options.html: tests/directive-options.rst
	$(alectryon) $<
tests_targets += _output/tests/directive-options.html
# reST → LaTeX
_output/tests/directive-options.xe.tex: tests/directive-options.rst
	$(alectryon) $< --latex-dialect xelatex -o $@
tests_targets += _output/tests/directive-options.xe.tex

# reST → HTML
_output/tests/display-flags.html: tests/display-flags.rst
	$(alectryon) $<
tests_targets += _output/tests/display-flags.html

# Run doctests
_output/tests/doctests.out: tests/doctests.py | _output/tests/
	$(PYTHON) $< | sed 's/\(tests\) in [0-9.]\+s$$/\1/g' > $@
tests_targets += _output/tests/doctests.out

# reST → JSON errors
_output/tests/errors.lint.json: tests/errors.rst
	$(alectryon) $< --backend lint; echo "exit: $$?" >> $@
tests_targets += _output/tests/errors.lint.json
# reST → HTML + errors
_output/tests/errors.txt: tests/errors.rst
	$(alectryon) $< --copy-assets none --backend webpage -o /dev/null 2> $@; echo "exit: $$?" >> $@
tests_targets += _output/tests/errors.txt

# Coq+reST → LaTeX
_output/tests/latex_formatting.tex: tests/latex_formatting.v
	$(alectryon) $< --backend latex
tests_targets += _output/tests/latex_formatting.tex

# reST → Coq
_output/tests/literate.v: tests/literate.rst
	$(alectryon) $< --backend coq
tests_targets += _output/tests/literate.v

# Coq → reST
_output/tests/literate.v.rst: tests/literate.v
	$(alectryon) $< --backend rst --mark-point 522 ⊙
tests_targets += _output/tests/literate.v.rst

# Coq → HTML
_output/tests/screenshot.html: tests/screenshot.v
	$(alectryon) $<
tests_targets += _output/tests/screenshot.html

# reST → HTML
_output/tests/stylesheets.html: tests/stylesheets.v
	DOCUTILSCONFIG=tests/stylesheets.docutils.conf \
       $(alectryon) $< --pygments-style emacs -o - | sed -r '/^ *<style type="text.css">/,/^ *<.style>/ { /^ *<style |<.style>|Alectryon/b; d}' > $@
tests_targets += _output/tests/stylesheets.html
# reST → LaTeX
_output/tests/stylesheets.part.tex: tests/stylesheets.v
	DOCUTILSCONFIG=tests/stylesheets.docutils.conf \
       $(alectryon) $< --pygments-style emacs --backend latex -o - | sed -r '/^% embedded stylesheet/,/^\\makeatother/ { /^\\makeat|Alectryon/b; d}' > $@
tests_targets += _output/tests/stylesheets.part.tex

# Coq → HTML
_output/tests/syntax_highlighting.html: tests/syntax_highlighting.v
	$(alectryon) $<
tests_targets += _output/tests/syntax_highlighting.html

$(tests_targets): out_dir := _output/tests
targets += $(tests_targets)
