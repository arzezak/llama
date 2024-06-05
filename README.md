# llama

A Neovim plugin to interact with Ollama.

## Installation

```lua
{ "arzezak/llama", dependencies = "arzezak/floaty" }
```

## Usage

```lua
:lua print(require("llama").ask("Hi there!"))
```

When run via the `Llama` command, it will receive the entire buffer as content or a visual line selection if one is present.

Responses will be rendered within a [floaty](https://github.com/arzezak/floaty) window.

```lua
:'<,'>Llama "Improve the grammar of this sentence"
```
