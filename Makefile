SHELL:=/usr/bin/env bash

.PHONY: help
# Run "make" or "make help" to get a list of user targets
# Adapted from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk 'BEGIN { \
	 FS = ":.*?## "; \
	 printf "\033[1m%-30s\033[0m %s\n", "TARGET", "DESCRIPTION" \
	} \
	{ printf "\033[32m%-30s\033[0m %s\n", $$1, $$2 }'

#
# Presentation exportation
#

.PHONY: presentations
presentations: presentations-html presentations-pdf ## Export all presentations to HTML and PDF

MARP_FLAGS:=--allow-local-files --theme-set $(SUPPORT_DIR)/csd-workshop2023.css

# Export the given markdown presentation to html
%.html: %.md node_modules support
	npx @marp-team/marp-cli -o $*.html $(MARP_FLAGS) -- $*.md

.PHONY: presentations-html
presentations-html: presentation.html
	@echo Generated presentation HTML...


# Export the given markdown presentation to pdf
%.pdf: %.md node_modules support
	npx @marp-team/marp-cli -o $*.pdf $(MARP_FLAGS) -- $*.md

.PHONY: presentations-pdf
presentations-pdf: presentation.pdf ## Export all presentations to PDF
	@echo Generated presentation PDFs...

#
# Dependencies/misc
#

.PHONY: dependencies
dependencies: node_modules ## Download dependencies
	@echo Downloaded dependencies...

# Ensure dependencies have been downloaded
node_modules: package.json package-lock.json
	npm ci

.PHONY: clean
clean:
	rm -f presentation**.html presentation**.pdf
