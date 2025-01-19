return {
	open = true,
	columns = {
		"icon",
	},
	view_options = {
		show_hidden = true,
	},
	delete_to_trash = true,
	default_file_explorer = true,
	prompt_save_on_select_new_entry = true,
	cleanup_delay_ms = 2000,
	watch_for_changes = true,
	keymaps = {
		["<CR>"] = "actions.select",
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-w>"] = { "actions.close", mode = "n" },
		["<C-r>"] = "actions.refresh",
		["<C-p>"] = "actions.preview",
		-- ["<>"] = { "actions.parent", mode = "n" },
		["`"] = { "actions.open_cwd", mode = "n" },
		["<leader>cd"] = { "actions.cd", mode = "n" },
		["<leader>ct"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["<leader>\\"] = { "actions.toggle_trash", mode = "n" },
		["<leader>y"] = { "actions.yank_entry", mode = "n" },
	},
	float = {
		padding = 4,
		max_width = 120,
		max_height = 60,
	},
	use_default_keymaps = false,
}
