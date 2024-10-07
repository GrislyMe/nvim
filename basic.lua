vim.cmd("colorscheme gruvbox")
vim.cmd("set colorcolumn=80")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("set scl=yes:1")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.list = true

vim.o.syntax = "on"
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.scrolloff = 5
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.cindent = true
vim.o.confirm = true
vim.o.laststatus = 2
vim.o.showmode = true
vim.o.showmatch = true
vim.o.wrap = true
vim.o.autowrite = true
vim.o.mouse = "a"

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua", "javascript", "html", "c", "cpp", "h", "hpp" },
	command = "setlocal shiftwidth=2 tabstop=2",
})
