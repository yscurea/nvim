# My neovim configuration

This is my neovim configuration.

## Usage

Clone this repository into ~/.config/nvim

## set environment (if you use Windows OS)

- HOME : `~`
- XDG_CACHE_HOME : `~/.cache`
- XDG_CONFIG_HOME : `~/.config`
- XDG_DATA_HOME : `~/.local/share`
- XDG_STATE_HOME : `~/.local/state`

## Requirement

Install tools that the plugin depends on.

- required
  - gcc which treesiter depend on. see [nvim-treesitter wiki](https://github.com/nvim-treesitter/nvim-treesitter/wiki)
  - [efm-langserver](https://github.com/mattn/efm-langserver)
  - [Nerd Font](https://www.nerdfonts.com)
- optional
  - Install any LSPs

This repo is also practicable in [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim).
Install the extension, and write settings.json like this.

```settings.json
{
    "vscode-neovim.neovimInitVimPaths.win32": "<Your path to init.lua>",
    "vscode-neovim.neovimInitVimPaths.darwin": "<Your path to init.lua>",
    "vscode-neovim.neovimInitVimPaths.linux": "<Your path to init.lua>",
    "vscode-neovim.compositeKeys": {
        "jk": {
            "command": "vscode-neovim.escape"
        },
        "kj": {
            "command": "vscode-neovim.escape"
        },
        "kk": {
            "command": "vscode-neovim.escape"
        },
        "jj": {
            "command": "vscode-neovim.escape"
        }
    }
}
```
