.PHONY: pdf
pdf:
	latexmk -pdflua manuscript

.PHONY: clean
clean:
	latexmk -C manuscript
	rm -f *.ltjruby
