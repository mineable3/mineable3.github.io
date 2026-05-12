all:
	eval pandoc inputs/inputs.md --verbose --mathjax=https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js >> inputs/index.html
