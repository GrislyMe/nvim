local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- space as leader key
vim.g.mapleader = " "

-- command WQ wq
vim.api.nvim_create_user_command("WQ", ":wq", {})
-- command Wq wq
vim.api.nvim_create_user_command("Wq", ":wq", {})
-- command W w
vim.api.nvim_create_user_command("W", ":w", {})
-- command Q q
vim.api.nvim_create_user_command("Q", ":q", {})


-- change focus
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", {})

-- toggle file mgr
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {})

-- floating terminal
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", {})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- misc
vim.api.nvim_set_keymap("i", "<Home>", "<Esc>^i", {})

-- swap between open tab
vim.api.nvim_set_keymap("n", "<leader><S-Tab>", ":bp<CR>", {})
vim.api.nvim_set_keymap("n", "<leader><Tab>", ":bn<CR>", {})

-- wrap selected word
vim.api.nvim_set_keymap("x", "<", "c<><Esc>P", {})
vim.api.nvim_set_keymap("x", "(", "c()<Esc>P", {})
vim.api.nvim_set_keymap("x", "[", "c[]<Esc>P", {})
vim.api.nvim_set_keymap("x", "{", "c{}<Esc>P", {})
vim.api.nvim_set_keymap("x", "'", "c''<Esc>P", {})
vim.api.nvim_set_keymap("x", '"', 'c""<Esc>P', {})

vim.api.nvim_set_keymap("x", ">", "i<d<Esc>vhp", {})
vim.api.nvim_set_keymap("x", ")", "i(d<Esc>vhp", {})
vim.api.nvim_set_keymap("x", "]", "i[d<Esc>vhp", {})
vim.api.nvim_set_keymap("x", "}", "i{d<Esc>vhp", {})

vim.api.nvim_set_keymap("n", "<leader>a", ":Lspsaga code_action<CR>", {})
vim.api.nvim_set_keymap("n", "gf", ":Lspsaga finder<CR>", {})
vim.api.nvim_set_keymap("n", "gd", ":Lspsaga peek_definition<CR>", {})
vim.api.nvim_set_keymap("n", "gt", ":Lspsaga goto_definition<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>o", ":LSoutlineToggle<CR>", {})
vim.api.nvim_set_keymap("n", "<F2>", ":Lspsaga rename<CR>", {})
vim.api.nvim_set_keymap("n", "e", ":Lspsaga diagnostic_jump_next<CR>", {})
vim.api.nvim_set_keymap("n", "E", ":Lspsaga diagnostic_jump_prev<CR>", {})

--git
vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})

-- hydra
local DapHint  = [[
_o_: Step out
_s_: Step into
_n_: Step over
_N_: Step back
_B_: Toggle break
_<F5>_: Continue
_X_: Terminate
_*_: Run to cursor
_e_: Eval
_i_: Nil
    ]]

local DapHydra = require('hydra')
DapHydra({
	name = "DEBUG",
	mode = 'n',
	body = '<leader>d',
	hint = DapHint,
	config = {
		desc = "Debug mode",
		invoke_on_body = true,
		hint = {
			hide_on_load = false,
			position = "middle-right",
			show_name = true,
		},
		color = "pink",
	},
	heads = {
		{ '<F5>', function() require('dap').continue() end },
		{ 'B',    function() require('dap').toggle_breakpoint() end },
		{ 'n',    function() require('dap').step_over() end },
		{ 's',    function() require('dap').step_into() end },
		{ 'e',
			function() require('dapui').eval() end,
			{ mode = 'v' }
		},
		{ "N", function() require("dap").step_back() end },
		{ "o", function() require("dap").step_out() end },
		{ "i", nil },
		{ "X", function() require("dap").terminate() end },
		{ "*", function() require("dap").run_to_cursor() end },
	},
})

-- local GitHint  = [[
-- _s_: open main page
--     ]]
--
-- local neogit   = require('neogit')
-- local GitHydra = require('hydra')
-- GitHydra({
-- 	name = "Git",
-- 	mode = 'n',
-- 	body = '<leader>g',
-- 	hint = GitHint,
-- 	config = {
-- 		desc = "Git mode",
-- 		invoke_on_body = true,
-- 		hint = {
-- 			hide_on_load = false,
-- 			position = "middle-right",
-- 			show_name = true,
-- 		},
-- 		color = "pink",
-- 	},
-- 	heads = {
-- 		{ 's', function() neogit.open() end },
-- 	},
-- })
