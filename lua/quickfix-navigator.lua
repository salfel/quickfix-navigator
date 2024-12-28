local M = {}

function M.isQuickfixOpen()
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			return true
		end
	end

	return false
end

function M.getCurrentIdx()
	return vim.fn.getqflist({ idx = 0 }).idx
end

function M.getLength()
	return #vim.fn.getqflist()
end

function M.nextQuickFix()
	if M.isQuickfixOpen() then
		if M.getCurrentIdx() == M.getLength() then
			vim.cmd("cc1")
		else
			vim.cmd("cnext")
		end
	end
end

function M.prevQuickFix()
	if M.isQuickfixOpen() then
		if M.getCurrentIdx() == 1 then
			vim.cmd("cc" .. M.getLength())
		else
			vim.cmd("cprev")
		end
	end
end

function M.setup(opts)
	opts = opts or {}

	local default_keymaps = {
		previous = "<C-p>",
		next = "<C-n>",
		close = "<leader>c",
	}

	local keymaps = vim.tbl_deep_extend("force", default_keymaps, opts.keymaps or {})

	vim.keymap.set("n", keymaps.previous, M.prevQuickFix)
	vim.keymap.set("n", keymaps.next, M.nextQuickFix)

	vim.keymap.set("n", keymaps.close, ":cclose<CR>")
end

return M
