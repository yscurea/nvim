# Nvimの設定

## インストール

### 前準備

#### ツールのインストール

- neovim本体のインストール（現在v0.10.0)
- treesitterの依存先であるgccのインストール
- 各LSPのインストール

※ windowsならscoopを使うと楽

#### 環境変数の設定

- HOME : `~`
- XDG_CACHE_HOME : `~/.cache`
- XDG_CONFIG_HOME : `~/.config`
- XDG_DATA_HOME : `~/.local/share`
- XDG_STATE_HOME : `~/.local/state`

#### ターミナルの設定

##### フォントの設定

NordFontをインストールしてターミナルのフォントに設定する
[nerdfonts](https://www.nerdfonts.com)から好みのフォントをインストール

##### Terminalからneovimにコマンドが送信されるようにする

WindowsTerminalの場合、デフォルトではneovimにctrl+spaceを送信しないので、修正する\
<https://github.com/neovim/neovim/issues/8435>

``` settings.json
{
  “keys”: “ctrl+space”,
  “command”: {
    “action”: “sendInput”,
    “input”: “`\u0`{=tex}01b\[32;5u”
  }
}
```

### 起動後の設定

#### プラグインのインストール

lazy.nvimによって初期ダウンロードと各プラグインの遅延読み込みが行われる\

#### treesitterのインストール

treesitterによる色付けを行うために、各ファイルの拡張子に従って\
`:TSInstall lua`のようにTreesitterをインストールする。

#### LSPのインストール

個別にLSPをインストールしても良い\
その他はMasonコマンドを使用してインストールする\
Masonなどでインストールした後はlspconfig.luaに記述済みのLSPの設定を参考に記述することを忘れずに行う。\
記述例は[github](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
かTelescopeでhelp検索画面を出し、lspconfig-server-configurationsで検索する。

#### efm-langserverのインストール

`scoop install go`
`go install github.com/mattn/efm-langserver@latest`
