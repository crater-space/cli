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
	@echo "Making sure SBCL is installed..."
ifneq ($(shell command -v sbcl),)
	@echo "SBCL found."
else ifneq ($(shell command -v xbps-query),)
	sudo xbps-install -Syu sbcl
else ifneq ($(shell command -v pacman),)
	sudo pacman -Sy sbcl
else ifneq ($(shell command -v dnf),)
	sudo dnf install -y sbcl
else ifneq ($(shell command -v apt),)
	sudo apt install -y sbcl
else
	@echo "Could not determine steps to install SBCL! Please install SBCL and try again."
	exit 1
endif
	@echo "Looking for external dependencies..."
ifeq ($(shell command -v xrandr),)
	@echo "'xrandr' not found!"
	exit 1
endif
	@echo "All required dependencies found."

quicklisp:
ifeq ("$(wildcard $(QUICKLISP_DIR))", "")
	@echo "Setting up Quicklisp..."
	curl https://beta.quicklisp.org/quicklisp.lisp -o /tmp/quicklisp.lisp
	sbcl --load /tmp/quicklisp.lisp --non-interactive --eval "(quicklisp-quickstart:install)"
	sbcl --load ~/quicklisp/setup.lisp --non-interactive --eval "(ql:add-to-init-file)"
else
	@echo "Quicklisp found."
endif

binary:
	@echo "Generating binary..."
	sbcl --non-interactive --load build.lisp
	@echo "Binary generated."

place:
	@echo "Installing binary..."
	sudo install ./crater-bin $(PREFIX)/bin/crater
	sudo install ./scripts/* $(PREFIX)/bin/
	@echo "Binary installed."

manpage:
	@echo "Creating manpage..."
	sudo rsync ./man/crater.1 $(MANPREFIX)/man1/
	@echo "Manpage created."

install: primary-deps quicklisp binary place manpage
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
