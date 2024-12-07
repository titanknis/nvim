-- functions.lua
function RunCode()
	-- Get file info
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%:t") -- Just the filename
	local outfile = vim.fn.expand("%:t:r") -- Filename without extension
	local dir = vim.fn.expand("%:p:h") -- Directory of current file

	local commands = {
		python = string.format("cd %s && python %s", dir, file),
		c = string.format("cd %s && clang %s -o %s && ./%s", dir, file, outfile, outfile),
		cpp = string.format("cd %s && clang++ %s -o %s && ./%s", dir, file, outfile, outfile),
		java = string.format("cd %s && javac %s && java %s", dir, file, outfile),
	}

	local cmd = commands[filetype]
	if cmd then
		vim.cmd("update") -- Save the file before running
		require("toggleterm").exec(cmd)
		vim.cmd("wincmd j") -- Move to terminal window
	else
		-- print("Filetype not supported")
		vim.notify("Filetype not supported for running", vim.log.levels.WARN)
	end
end
