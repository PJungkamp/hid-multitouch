# SPDX-License-Identifier: GPL-2.0-or-later
MODULE_NAME := "hid_multitouch"
MODULE_VERSION := "0.1"

KVERSION := "$(shell uname -r)"
KDIR := /lib/modules/$(KVERSION)/build
MDIR := /usr/src/$(MODULE_NAME)-$(MODULE_VERSION)

CHECKPATCH_OPTS := -f -q --no-tree
CHECKPATCH := $(KDIR)/scripts/checkpatch.pl $(CHECKPATCH_OPTS)

sources-c := $(shell find . -type f \( -name "*.c" -and -not -name "*.mod.c" \))
sources-h := $(shell find . -type f -name "*.h")
sources-Kbuild := $(shell find . -type f -name "Kbuild")

sources := $(sources-c) $(sources-h) $(sources-Kbuild)


all:
	$(MAKE) -C $(KDIR) M=$(shell pwd) modules

clean:
	$(MAKE) -C $(KDIR) M=$(shell pwd) clean
