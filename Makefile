PLUGIN_DIR := $(HOME)/.config/zellij/plugins
OUTPUT := target/wasm32-wasip1/release/miserly-link.wasm
# Native target for tests
NATIVE_TARGET = aarch64-apple-darwin

.PHONY: build install

build:
	cargo build --release

test:
	cargo test --target $(NATIVE_TARGET)

install: build
	mkdir -p $(PLUGIN_DIR)
	cp $(OUTPUT) $(PLUGIN_DIR)/
