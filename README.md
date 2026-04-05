# miserly-link

Custom version of the default Zellij [link plugin](https://github.com/zellij-org/zellij/tree/main/default-plugins/link) that handles trailing periods gracefully.

## Why?

The default link plugin's file path regex will include a trailing `.` as part of the captured path. So if terminal output contains something like:

```
See ./src/main.rs.
```

The default plugin captures `./src/main.rs.` (including the period), which fails to resolve.

This plugin tweaks the regex so that a trailing period is excluded from the capture, correctly resolving `./src/main.rs`.

## Changes from default

- File path regex requires the last character to be a non-dot path character (`[A-Za-z0-9_/\-+@%,#=~!\$\{\}\[\]]`)
- `.` is added to the trailing boundary pattern
- Same fix applied to directory-entry highlight patterns
- Permissions are explicitly requested at load time (rather than relying on auto-grant)

## Build and install

```
cargo build --release
mkdir ~/.config/zellij/plugins
cp target/wasm32-wasip1/release/miserly-link.wasm ~/.config/zellij/plugins
```

Then edit config.kdl to load it instead of file:link:

```
load_plugins {
    // "zellij:link"
    "file:~/.config/zellij/plugins/miserly-link.wasm"
}
```
