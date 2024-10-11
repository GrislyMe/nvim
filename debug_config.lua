local dap, dapui                                   = require("dap"), require("dapui")
dap.adapters.gdb                                   = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}
dap.configurations.c                               = {
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
