SHELL := /bin/bash
### 


help:
	@cat README.md
	@echo ""
	@echo "Commands:"
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'

###

updatedb: ## Update DB for this drvie.
updatedb:
	-(updatedb \
	--require-visibility 0 \
	--output  $(PWD)/.mlocate.db \
	--database-root . \
	)

locate:  ## Locate something on the disque
locate:
	-@(read -p "Please input pattern: " TOMATCH \
	&& locate -d $(PWD)/.mlocate.db "$$TOMATCH" \
	)
