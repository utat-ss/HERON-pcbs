.PHONY: help reset-common update-common

help:
	@echo "usage: make [help | reset-common | update-common]"
	@echo "Running make without any arguments is equivalent to running make help."
	@echo "help           display this help message"
	@echo "reset-common   reset all local changes to files in the pcbs-common folder (only in the submodule)"
	@echo "update-common  fetch the latest commit of pcbs-common"

# According to https://stackoverflow.com/questions/1789594/how-do-i-write-the-cd-command-in-a-makefile,
# need to add "&& \" to join commands together in the same subprocess
reset-common:
	cd pcbs-common && \
	git reset --hard && \
	cd ..

update-common:
	git submodule update --remote
