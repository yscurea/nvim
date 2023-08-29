# Nvimの設定

lazy.nvimによって初期ダウンロードと各プラグインの遅延読み込みが行われる

## ファイル構成

- lua/core/mappings.lua : 基本マッピング
- lua/core/options.lua : Nvim 基本設定
- lua/core/plugins.lua : プラグイン初期設定
- lua/core/utils.lua : 便利関数の定義
- lua/plugins/plugin_list.lua : プラグイン一覧
- lua/plugins/configs/* : 各プラグインの設定
- lua/plugins/mappings/* : 各プラグインのマッピング設定
