# pandoc inputs/inputs.md -s -o inputs/index.html --verbose --mathjax=https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js --css=../styles/styles.css --css=../styles/blog_post.css --metadata-file=inputs/meta.yaml

BLOG_DUMP_DIR := ./src/blogs
PLAIN_TEXT_BLOGS := $(wildcard $(BLOG_DUMP_DIR)/*/README.md)
COMPILED_BLOGS := $(patsubst %/README.md, %/index.html, $(PLAIN_TEXT_BLOGS))
COMPILER := compiler.py

all: $(COMPILED_BLOGS)
	@echo plain text: $(PLAIN_TEXT_BLOGS)
	@echo compiled: $(COMPILED_BLOGS)
	@echo Done.

$(BLOG_DUMP_DIR)/%/index.html: $(BLOG_DUMP_DIR)/%/README.md src/stubs/header.html src/stubs/closing.html compiler.py
	$(eval CURRENT_DIR := $(patsubst %/,%,$(dir $@)))

	@#echo "Compiling in: $(CURRENT_DIR)"

	pandoc $< --verbose --mathjax=scripts/mathjax.js > $(CURRENT_DIR)/body.html

	@#cp compiler.py $(CURRENT_DIR)/temp_compiler.py
	python3 compiler.py $(CURRENT_DIR)
	@#rm $(CURRENT_DIR)/temp_compiler.py
	
	@echo Done compiling "$@"
