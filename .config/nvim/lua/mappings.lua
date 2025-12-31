local map = vim.keymap.set

-- let j and k move up and down lines that have been wrapped
map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
map("n", "J", "mzJ`z", { desc = "Append next line to the end of current" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Up" })
-- Keep cursor in the middle
map("n", "<C-d>", "<C-d>zz", { desc = "Move Selected Up", remap = true })
map("n", "<C-u>", "<C-u>zz", { desc = "Move Selected Up", remap = true })

map("n", "n", "nzzzv", { desc = "Search", remap = true })
map("n", "N", "Nzzzv", { desc = "Search", remap = true })

-- Separate clipboards
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into OS clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line into OS clipboard" })

-- Void register
map("x", "<leader>p", [["_dP]], { desc = "No-copy Paste" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Void Register Delete" })

-- Comment
-- map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "Toggle Comment", remap = true })

-- Git
map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
map("n", "<leader>gu", "<cmd>UndotreeToggle<cr>", { desc = "UndoTree Toggle" })

map("n", "<Tab>", "gt", { desc = "Next Tab", remap = true })
map("n", "<S-Tab>", "gT", { desc = "Prev Tab", remap = true })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Oil
local oil = require("oil")

map("n", "<C-e>", function()
	oil.open()
end, { desc = "Explorer", silent = true })

-- Treesitter Mappings
local builtin = require("telescope.builtin")

map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
map("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
map("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local lsp_map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Find references for the word under your cursor.
		lsp_map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		lsp_map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		lsp_map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		lsp_map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		lsp_map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		lsp_map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		lsp_map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		lsp_map("<leader>lr", vim.lsp.buf.rename, "[R]ename")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		lsp_map("<leader>lc", vim.lsp.buf.code_action, "[C]ode Action", { "n", "x" })

		lsp_map("<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "[T]oggle")

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			lsp_map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end

		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

-- Trouble

map("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[T]oggle Diagnostics" })
map("n", "<leader>tX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "[T]oggle Buffer Diagnostics" })

map("n", "<leader>tL", "<cmd>Trouble loclist toggle<cr>", { desc = "[T]oggle Location List" })
map("n", "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", { desc = "[T]oggle Quickfix List" })

map("n", "<leader>tt", function()
	vim.diagnostic.open_float({})
end, { desc = "Error in floating window" })

-- map("n", "<F5>", function()
-- 	require("dap").continue()
-- end, { desc = "Debug: Start/Continue" })
--
-- map("n", "<F1>", function()
-- 	require("dap").step_into()
-- end, { desc = "Debug: Step Into" })
--
-- map("n", "<F2>", function()
-- 	require("dap").step_over()
-- end, { desc = "Debug: Step Over" })
--
-- map("n", "<F3>", function()
-- 	require("dap").step_out()
-- end, { desc = "Debug: Step Out" })
--
-- map("n", "<leader>b", function()
-- 	require("dap").toggle_breakpoint()
-- end, { desc = "Debug: Toggle Breakpoint" })
--
-- map("n", "<leader>B", function()
-- 	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- end, { desc = "Debug: Set Breakpoint" })
-- -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
-- map("n", "<F7>", function()
-- 	require("dapui").toggle()
-- end, { desc = "Debug: See last session result." })
