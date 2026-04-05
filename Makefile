PLUGIN_DIR := $(HOME)/.config/zellij/plugins
TARGET := target/wasm32-wasip1/release/miserly-link.wasm

.PHONY: build install

build:
	cargo build --release

install: build
	mkdir -p $(PLUGIN_DIR)
	cp $(TARGET) $(PLUGIN_DIR)/
