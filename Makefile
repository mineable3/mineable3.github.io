# pandoc inputs/inputs.md -o inputs/index.html --verbose --mathjax=https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js --css=../styles/styles.css --css=../styles/blog_post.css --metadata-file=inputs/meta.yaml

all:
	@#cat inputs/header.html > inputs/index.html

	pandoc inputs/inputs.md --verbose \
	--mathjax=scripts/mathjax.js > inputs/body.html

	@#cat inputs/closing.html >> inputs/index.html

	python3 inputs/compiler.py
