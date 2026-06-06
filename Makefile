# pandoc inputs/inputs.md -s -o inputs/index.html --verbose --mathjax=https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js --css=../styles/styles.css --css=../styles/blog_post.css --metadata-file=inputs/meta.yaml

BLOG_DUMP_DIR := ./src/blogs
PLAIN_TEXT_BLOGS := $(wildcard $(BLOG_DUMP_DIR)/*/README.md)
COMPILED_BLOGS := $(patsubst %/README.md, %/index.html, $(PLAIN_TEXT_BLOGS))
COMPILER := ./scripts/compiler.py
BLOG_LIST := ./src/blog_list.html

all: $(COMPILED_BLOGS) $(BLOG_LIST)
	@#echo plain text: $(PLAIN_TEXT_BLOGS)
	@#echo compiled: $(COMPILED_BLOGS)
	@#TODO: add script to update home page + blog list last updated dates
	@echo Done.

$(BLOG_DUMP_DIR)/%/index.html: $(BLOG_DUMP_DIR)/%/README.md src/stubs/header.html src/stubs/closing.html $(COMPILER)
	$(eval CURRENT_DIR := $(patsubst %/,%,$(dir $@)))

	@printf "Compiling: $(CURRENT_DIR). "

	@# Compiles html from markdown (README.md)
	@pandoc $< --verbose --mathjax=scripts/mathjax.js > $(CURRENT_DIR)/body.html

	@# Adds the meta data and link to the blog list
	@python3 $(COMPILER) $(CURRENT_DIR)
	@rm $(CURRENT_DIR)/body.html
	
	@printf "FINISHED.\n"
