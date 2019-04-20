.PHONY: help reset-common pcbs-common update-submodules

help:
	@echo "usage: make [help | reset-common | update-common]"
	@echo "Running make without any arguments is equivalent to running make help."
	@echo "help           display this help message"
	@echo "pcbs-common  fetch the latest commit of pcbs-common"
	@echo "update-submodules fetch the latest submodules"

# According to https://stackoverflow.com/questions/1789594/how-do-i-write-the-cd-command-in-a-makefile,
# need to add "&& \" to join commands together in the same subprocess
pcbs-common:
	@echo "Fetching latest version of pcbs-common..."
	git submodule update --remote --force pcbs-common

update-submodules:
		@echo "Fetching latest version of submodules..."
		git submodule update --remote
