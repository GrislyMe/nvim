local dap, dapui     = require("dap"), require("dapui")
dap.adapters.gdb     = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			-- Get the current file's path without extension
			local filepath = vim.fn.expand('%:p:h') -- Get the directory of the current file
			local filename = vim.fn.expand('%:t:r') -- Get the current filename without extension
			local executable_path = filepath .. '/' .. filename

			-- Check if the executable exists in the same directory as the current file
			if vim.fn.filereadable(executable_path) == 1 then
				return executable_path
			else
				return vim.fn.input('Path to executable: ', filepath .. '/', 'file')
			end
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
	}
}

local hint           = [[
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
_?_: Hydra hint
    ]]

local DapHydra       = require('hydra')
DapHydra({
	name = "DEBUG",
	mode = 'n',
	body = '<leader>d',
	hint = hint,
	config = {
		desc = "Debug mode",
		invoke_on_body = true,
		hint = {
			hide_on_load = false,
			position = "middle-right",
			show_name = false,
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
		{ "?",
			function()
				if DapHydra.hint.win
				then
					DapHydra.hint:close()
				else
					DapHydra.hint:show()
				end
			end },
	},
})


dap.listeners.before.attach.dapui_config           = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config           = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config     = function()
	dapui.close()
end
