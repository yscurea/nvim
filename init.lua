-- 一般的な設定を読み込む
require("core.options")

-- 一般的なマッピングを読み込む
local mappings = require("core.mappings")
require("core.utils").load_mappings(mappings)

-- プラグイン
require("core.plugins")
