local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local sep = is_windows and "\\" or "/"
local opt = vim.opt
local g = vim.g

local ok, extui = pcall(require, "vim._extui")
if ok then
	extui.enable({
		enable = true, -- extuiを有効化
		msg = {
			pos = "cmd", -- 'box'か'cmd'だがcmdheight=0だとどっちでも良い？（記事後述）
			box = {
				timeout = 5000, -- boxメッセージの表示時間 ミリ秒
			},
		},
	})
end

-------------------------------------- globals -----------------------------------------
g.mapleader = " "
g.plugin_cache_dir = vim.fn.stdpath("data") .. sep .. "lazy"
-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_rrhelper = 1
g.loaded_2html_plugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.editorconfig = true
-- g.directory = vim.fn.stdpath("data")
opt.cmdheight = 0
opt.statuscolumn = ""
-- opt.guicursor              = "n-i:ver25"

-- vim.o.guicursor            = table.concat({
--   "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
--   "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
--   "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
-- }, ",")

-------------------------------------- options ------------------------------------------
vim.wo.wrap = false
opt.autoread = true
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- default indent style
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- row number
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.colorcolumn = "120"

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.list = true
opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"
opt.updatetime = 250

-- disable default some providers.
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- set nu shell, not cmd or pwsh
local powershell_options = {
	shell = vim.fn.executable("nu") == 1 and "nu" or "cmd",
	shellcmdflag = "-c",
	shellquote = "",
	shellxquote = "",
}
for option, value in pairs(powershell_options) do
	vim.opt[option] = value
end

-- set python path by uv python
local result = vim.fn.system("uv python find")
local function cr_lines(s)
	return s:gsub("\r\n?", "\n"):gmatch("(.-)\n")
end
g.python3_host_prog = cr_lines(result)()

-- into insert mode when open terminal.
vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = "*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- use rg instead of grep, if can execute ripgrep
if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep --hidden --glob ‘!.git’"
end
