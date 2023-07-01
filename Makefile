SHELL = /bin/sh

ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif
MANPREFIX := $(PREFIX)/share/man

help:
	@echo "Use one of the following options:"
	@echo " - install"
	@echo " - uninstall"
	@echo " - reinstall"
	@echo " - update"

primary-deps:
	@echo "Making sure 'curl' is installed..."
ifneq ($(shell command -v curl),)
	@echo "'curl' found."
else
	@echo "'curl' not found! Please install it manually and try again."
	exit 1
endif
	@echo "All required dependencies found."

place:
	@echo "Installing script..."
	sudo install ./crater $(PREFIX)/bin/crater
	sudo install ./scripts/* $(PREFIX)/bin/
	@echo "Script installed."

manpage:
	@echo "Creating manpage..."
	sudo rsync ./man/crater.1 $(MANPREFIX)/man1/
	@echo "Manpage created."

install: primary-deps place manpage
	@echo "crater is now installed."

uninstall:
	@echo "Uninstalling crater..."
	sudo rm $(PREFIX)/bin/crater*
	sudo rm $(MANPREFIX)/man1/crater.1
	@echo "crater has been uninstalled."

reinstall: uninstall install

get-latest:
	git pull origin main

update: get-latest reinstall
