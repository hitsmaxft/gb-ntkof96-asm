SHELL := /bin/bash

BUILD_DIR ?= build
export BUILD_DIR

.DEFAULT_GOAL := jp
.PHONY: all jp en clean help

all: jp en

jp:
	./build.sh jp

en:
	./build.sh en

clean:
	./build.sh clean

help:
	@echo "KOF96 build targets:"
	@echo "  make / make jp  Build and package the Japanese mixed-roster ROM"
	@echo "  make en         Build and package the English ROM"
	@echo "  make all        Build and package JP and EN ROMs"
	@echo "  make clean      Remove build/ and legacy root build outputs"
